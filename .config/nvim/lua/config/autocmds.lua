-- Disable autoformat for markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "md" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained" }, {
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
