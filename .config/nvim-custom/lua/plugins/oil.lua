return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		skip_confirm_for_simple_edits = true,
		view_options = {
			is_hidden_file = function(name)
				return name == ".git"
			end,
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Oil<cr>", desc = "File explorer" },
	},
}
