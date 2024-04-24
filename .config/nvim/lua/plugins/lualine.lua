function Harpoon_files()
	local harpoon = require("harpoon")

	vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
	vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
	vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
	vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
	vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")

	local contents = {}
	local marks_length = harpoon:list():length()
	local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
	for index = 1, marks_length do
		local harpoon_file_path = harpoon:list():get(index).value
		local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ":t")

		if current_file_path == harpoon_file_path then
			contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
		else
			contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, file_name)
		end
	end

	return table.concat(contents)
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "rsreimer/codeowners.nvim", opts = {} },
	},
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = {
				function()
					return require("codeowners").get_buf_owner()
				end,
			},
			lualine_y = { "filetype" },
			lualine_z = { "location" },
		},

		tabline = {
			lualine_a = { Harpoon_files },
		},
	},
}
