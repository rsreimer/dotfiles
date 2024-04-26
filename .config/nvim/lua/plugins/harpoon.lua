return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({})

		local lualine_harpoon = require("utils.lualine-harpoon")
		lualine_harpoon.init()

		require("harpoon.extensions").extensions:add_listener({
			ADD = lualine_harpoon.update,
			REMOVE = lualine_harpoon.update,
			REPLACE = lualine_harpoon.update,
			REORDER = lualine_harpoon.update,
			UI_CREATE = lualine_harpoon.update,
			POSITION_UPDATED = lualine_harpoon.update,
			LIST_CHANGE = lualine_harpoon.update,
		})

    -- stylua: ignore start
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Add file"})
		vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Harpoon list"})
		vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end, {desc = "Remove current buffer"})

		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, {desc = "which_key_ignore"})

		vim.keymap.set("n", "H", function() harpoon:list():prev() end)
		vim.keymap.set("n", "L", function() harpoon:list():next() end)
		-- stylua: ignore end
	end,
}
