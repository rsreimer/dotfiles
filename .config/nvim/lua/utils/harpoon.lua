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

function M.init()
	vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
	vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
	vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
	vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")

	M.items = {}
end

function M.update_items()
	local harpoon = require("harpoon")

	M.items = {}

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
	end
end

function M.get_lualine_items()
	local contents = {}
	local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")

	for _, item in pairs(items) do
		local is_active = current_file_path == item.value

		local format = is_active and "%%#HarpoonNumberActive#%s %%#HarpoonActive#%s"
			or "%%#HarpoonNumberInactive#%s %%#HarpoonInactive#%s"

		table.insert(contents, string.format(format, item.index, item.label))
	end

	return table.concat(contents, "  ")
end

return M
