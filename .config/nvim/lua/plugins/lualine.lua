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
			lualine_x = {
				function()
					return require("utils.harpoon").get_lualine_items()
				end,
			},
		},
	},
}
