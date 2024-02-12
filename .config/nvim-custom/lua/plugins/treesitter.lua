return {
	{
		"echasnovski/mini.ai",
		opts = {
			n_lines = 500,
		},
		dependencies = {
			"whick-key/which-key.nvim",
			config = function()
				-- register all text objects with which-key
				local desc = {
					[" "] = "Whitespace",
					['"'] = 'Balanced "',
					["'"] = "Balanced '",
					["`"] = "Balanced `",
					["("] = "Balanced (",
					[")"] = "Balanced )",
					[">"] = "Balanced >",
					["<lt>"] = "Balanced <",
					["]"] = "Balanced ]",
					["["] = "Balanced [",
					["}"] = "Balanced }",
					["{"] = "Balanced {",
					["?"] = "User Prompt",
					_ = "Underscore",
					a = "Argument",
					b = "Balanced ), ], }",
					c = "Class",
					f = "Function",
					o = "Block, conditional, loop",
					q = "Quote `, \", '",
				}

				require("which-key").register({
					mode = { "o", "x" },
					i = desc,
					a = desc,
				})
			end,
		},
	},
	{
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
	},
}
