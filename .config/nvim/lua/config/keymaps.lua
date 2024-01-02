-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Save file
del({ "i", "x", "n", "s" }, "<C-s>")
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Git
map("n", "<leader>ghf", "<cmd>Telescope git_bcommits<cr>", { desc = "File history" })
map("v", "<leader>ghf", "<cmd>Telescope git_bcommits_range<cr>", { desc = "Selection history" })
map("n", "<leader>gp", "<cmd>Git pull<cr>", { desc = "Pull" })
map("n", "<leader>gP", "<cmd>Git push<cr>", { desc = "Push" })
map("n", "<leader>gb", ":Git checkout ", { desc = "Checkout" })
map("n", "<leader>gn", ":Git checkout -b ", { desc = "New branch" })

-- Search/Replace
map("n", "<leader>r", ":%s//c<left><left>", { desc = "Replace" })
map("v", "<leader>r", '"sy:%s/<c-r>s//c<left><left>', { desc = "Replace" })

-- Redo
map("n", "U", "<C-R>", { desc = "Redo" })

-- Keep highlight after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Home/End keymaps
map("", "L", "$", { desc = "End of line" })
map("", "H", "^", { desc = "Start of line" })

-- Remove terminal keymaps
del("n", "<leader>ft")
del("n", "<leader>fT")
del("n", "<c-/>")
del("n", "<c-_>")

-- Remove Lazygit
del("n", "<leader>gG")
del("n", "<leader>gg")

-- Disable move to window using the <ctrl> hjkl keys
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")
