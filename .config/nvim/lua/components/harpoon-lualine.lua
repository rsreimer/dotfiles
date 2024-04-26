require("utils.string")
require("utils.table")

local M = {}

local function set_unique_label(items)
	local tree = {}
	tree["!children"] = 0

	for _, item in pairs(items) do
		local node = tree
		local sections = item.sections

		for i, child in ipairs(sections) do
			if node[child] == nil then
				if i == #sections then
					node[child] = item
				else
					node[child] = {}
					node[child]["!children"] = 0
				end

				node[child]["!parent"] = node
				node[child]["!name"] = child
				node["!children"] = node["!children"] + 1
			end

			node = node[child]
		end
	end

	for _, item in pairs(items) do
		item.label = item["!name"]

		local node = item["!parent"]

		while node["!parent"] ~= nil do
			if node["!parent"]["!children"] > 1 then
				item.label = node["!name"] .. "/" .. item.label
			end

			node = node["!parent"]
		end

		item["!parent"] = nil
		item["!name"] = nil
	end
end

function M.setup()
	vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
	vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
	vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
	vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")

	M.update()

	require("harpoon.extensions").extensions:add_listener({
		ADD = M.update,
		REMOVE = M.update,
		REPLACE = M.update,
		REORDER = M.update,
		UI_CREATE = M.update,
		POSITION_UPDATED = M.update,
		LIST_CHANGE = M.update,
	})
end

function M.update()
	local harpoon = require("harpoon")

	local items = {}

	for index = 1, harpoon:list():length() do
		local harpoonItem = harpoon:list():get(index)

		if harpoonItem ~= nil and harpoonItem.value ~= "" then
			local path = string.starts_with(harpoonItem.value, "oil://")
					and string.sub(harpoonItem.value, 1 + string.len("oil://" .. vim.fn.getcwd() .. "/"))
				or harpoonItem.value

			local item = {
				index = index,
				value = harpoonItem.value,
				path = path,
				sections = string.split(path, "/"),
			}

			table.insert(items, item)
		end
	end

	for _, item in pairs(items) do
		if item.label == nil then
			local items_with_same_name = table.filter(items, function(v)
				return v.sections[#v.sections] == item.sections[#item.sections]
			end)

			if #items_with_same_name == 1 then
				item.label = item.sections[#item.sections]
			else
				set_unique_label(items_with_same_name)
			end
		end

		item.label_active = string.format("%%#HarpoonNumberActive#%s %%#HarpoonActive#%s", item.index, item.label)
		item.label_inactive = string.format("%%#HarpoonNumberInactive#%s %%#HarpoonInactive#%s", item.index, item.label)
	end

	M.items = items
end

function M.get_lualine()
	local contents = {}
	local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")

	for _, item in pairs(M.items) do
		local label = current_file_path == item.value and item.label_active or item.label_inactive
		table.insert(contents, label)
	end

	return table.concat(contents, "  ")
end

return M
