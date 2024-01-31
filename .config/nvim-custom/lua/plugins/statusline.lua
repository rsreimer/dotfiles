return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			theme = "tokyonight",
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
