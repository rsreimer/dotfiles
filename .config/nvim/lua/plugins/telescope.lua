return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"rsreimer/magnet.nvim",
			"nvim-lua/plenary.nvim",
		},
		opts = {
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
		},
		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("magnet")
		end,
		keys = function()
			local find_command = {
				"rg",
				"--files",
				"--smart-case",
				"--hidden",
				"--no-ignore",
				"--glob=!.git/",
				"--glob=!node_modules/",
				"--glob=!dist/",
				"--glob=!.nx/cache/",
				"--glob=!.angular/cache/",
			}

			local vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--no-ignore",
				"--glob=!.git/",
				"--glob=!node_modules/",
				"--glob=!dist/",
				"--glob=!.nx/cache/",
				"--glob=!.angular/cache/",
			}

			return {
				{
					"<leader><leader>",
					function()
						require("telescope").extensions.magnet.find_file({
							find_command = find_command,
						})
					end,
					desc = "Find Files",
				},
				{
					"<leader>sf",
					function()
						require("telescope").extensions.magnet.find_file({
							find_command = find_command,
						})
					end,
					desc = "Find Files",
				},
				{
					"<leader>sF",
					function()
						require("telescope").extensions.magnet.find_file({
							find_command = find_command,
							pick_dir = true,
						})
					end,
					desc = "Find Files In Directory",
				},
				{
					"<leader>sg",
					function()
						require("telescope").extensions.magnet.find_text({
							vimgrep_arguments = vimgrep_arguments,
						})
					end,
					desc = "Grep",
				},
				{
					"<leader>sG",
					function()
						require("telescope").extensions.magnet.find_text({
							vimgrep_arguments = vimgrep_arguments,
							pick_dir = true,
						})
					end,
					desc = "Grep in Directory",
				},
				{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
				{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
				{ "<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
				{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
				{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
				{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
				{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
				{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
				{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume Search" },
				{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
				{ "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Symbols" },
				{ "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
			}
		end,
	},
}
