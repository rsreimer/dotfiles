return {
	{
		"RRethy/vim-illuminate",
		config = function()
			local illuminate = require("illuminate")

			illuminate.configure({
				delay = 200,
				large_file_cutoff = 2000,
				large_file_overrides = {
					providers = { "lsp" },
				},
			})

			vim.keymap.set("n", "]]", function()
				illuminate.goto_next_reference()
			end, { desc = "Next Reference" })

			vim.keymap.set("n", "[[", function()
				illuminate.goto_prev_reference()
			end, { desc = "Prev Reference" })
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").register({
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>g"] = { name = "+git" },
				["<leader>s"] = { name = "+search" },
				["<leader>u"] = { name = "+ui" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			})
		end,
	},
	{
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
	},
}
