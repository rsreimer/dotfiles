return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				mode = "cursor",
				max_lines = 3,
			},
		},
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"query",
			"vimdoc",
			"vim",
			"regex",
			"typescript",
			"tsx",
			"json",
			"json5",
			"jsonc",
			"markdown",
			"markdown_inline",
			"yaml",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
			},
			move = {
				enable = true,
				set_jumps = true,
			},
		},
	},
}
