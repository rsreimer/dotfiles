return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame_opts = {
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 0,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
				vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev Hunk" })

				vim.keymap.set("n", "<leader>ghb", function()
					gs.blame_line({ full = true })
				end, { buffer = bufnr, desc = "blame details" })

				vim.keymap.set("n", "<leader>ghb", function()
					gs.toggle_current_line_blame()
				end, { buffer = bufnr, desc = "toggle blame" })
			end,
		},
	},
}
