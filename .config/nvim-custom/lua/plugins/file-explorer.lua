return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		local actions = require("oil.actions")

		oil.setup({
			skip_confirm_for_simple_edits = true,
			view_options = {
				is_hidden_file = function(name)
					return name == ".git"
				end,
			},
		})

		vim.keymap.set("n", "<leader>e", function()
			oil.open()
			actions.preview.callback()
		end, { desc = "File explorer" })
	end,
}
