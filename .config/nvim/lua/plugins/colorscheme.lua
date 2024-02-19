return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
