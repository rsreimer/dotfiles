return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "rsreimer/magnet.nvim" },
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup()
			telescope.load_extension("fzf")
			telescope.load_extension("magnet")

			vim.keymaps.set("n", "<leader><leader>", "<leader>sf", { desc = "Find Files" })

			vim.keymaps.set("n", "<leader>sf", "<cmd>Telescope magnet find_file<cr>", { desc = "Find Files" })
			vim.keymaps.set(
				"n",
				"<leader>sF",
				"<cmd>Telescope magnet find_file pick_dir=true<cr>",
				{ desc = "Find Files In Directory" }
			)

			vim.keymaps.set("n", "<leader>sg", "<cmd>Telescope magnet find_text<cr>", { desc = "Grep" })
			vim.keymaps.set(
				"n",
				"<leader>sG",
				"<cmd>Telescope magnet find_text pick_dir=true<cr>",
				{ desc = "Grep in Directory" }
			)

			vim.keymaps.set(
				"n",
				"<leader>sb",
				"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
				{ desc = "Buffers" }
			)

			vim.keymaps.set("n", "<leader>sgc", "<cmd>Telescope git_commits<cr>", { desc = "Commits" })

			vim.keymaps.set("n", "<leader>sgs", "<cmd>Telescope git_status<cr>", { desc = "Status" })

			vim.keymaps.set("n", '<leader>s"', "<cmd>Telescope registers<cr>", { desc = "Registers" })

			vim.keymaps.set("n", "<leader>sc", "<cmd>Telescope commands<cr>", { desc = "Commands" })

			vim.keymaps.set("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Diagnostics" })

			vim.keymaps.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })

			vim.keymaps.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })

			vim.keymaps.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps" })

			vim.keymaps.set("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "Resume Search" })

			vim.keymaps.set("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Symbols" })
			vim.keymaps.set("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Symbols" })

			vim.keymaps.set("n", "<leader>st", "<cmd>Telescope builtin<cr>", { desc = "Telescope" })
		end,
	},
}
