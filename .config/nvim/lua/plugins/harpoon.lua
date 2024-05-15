return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local harpoon_lualine = require("core.harpoon-lualine")

		harpoon:setup({})
		harpoon_lualine.setup()

    -- stylua: ignore start
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Add file"})
		vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Harpoon list"})
		vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end, {desc = "Remove current buffer"})
		vim.keymap.set("n", "<C-h>", function() harpoon:list():prev({ui_nav_wrap= true}) end, {desc = "Prev harpooned file"})
		vim.keymap.set("n", "<C-l>", function() harpoon:list():next({ui_nav_wrap= true}) end, {desc = "Next harpooned file"})

		vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end, {desc = "which_key_ignore"})
		vim.keymap.set("n", "<C-9>", function() harpoon:list():select(9) end, {desc = "which_key_ignore"})
		-- stylua: ignore end
	end,
}
