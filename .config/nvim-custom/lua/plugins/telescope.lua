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
			{ "<leader><leader>", "<cmd>Telescope magnet find_file<cr>", desc = "Find Files" },
			{ "<leader>sf", "<cmd>Telescope magnet find_file<cr>", desc = "Find Files" },
			{ "<leader>sF", "<cmd>Telescope magnet find_file pick_dir=true<cr>", desc = "Find Files In Directory" },
			{ "<leader>sg", "<cmd>Telescope magnet find_text<cr>", desc = "Grep" },
			{ "<leader>sG", "<cmd>Telescope magnet find_text pick_dir=true<cr>", desc = "Grep in Directory" },
			{ "<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>sgc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>sgs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume Search" },
			{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
			{ "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Symbols" },
			{ "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup()
			telescope.load_extension("fzf")
			telescope.load_extension("magnet")
		end,
	},
}
