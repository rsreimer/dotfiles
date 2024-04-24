return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"rsreimer/magnet.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader><leader>",
				function()
					require("telescope").extensions.magnet.find_file({
						hidden = true,
					})
				end,
				desc = "Find Files",
			},
			{
				"<leader>sf",
				function()
					require("telescope").extensions.magnet.find_file({
						hidden = true,
					})
				end,
				desc = "Find Files",
			},
			{
				"<leader>sF",
				function()
					require("telescope").extensions.magnet.find_file({
						hidden = true,
						pick_dir = true,
					})
				end,
				desc = "Find Files In Directory",
			},
			{
				"<leader>sg",
				function()
					require("telescope").extensions.magnet.find_text({
						vimgrep_arguments = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--hidden",
							"--glob=!.git",
						},
					})
				end,
				desc = "Grep",
			},
			{
				"<leader>sG",
				function()
					require("telescope").extensions.magnet.find_text({
						vimgrep_arguments = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--hidden",
							"--glob=!.git",
						},
						pick_dir = true,
					})
				end,
				desc = "Grep in Directory",
			},
			{ "<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>sgc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>sgs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume Search" },
			{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
			{ "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Symbols" },
			{ "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				pickers = {
					buffers = {
						sort_mru = true,
						mappings = {
							n = {
								["dd"] = "delete_buffer",
							},
							i = {
								["<c-d>"] = "delete_buffer",
							},
						},
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("magnet")
		end,
	},
}
