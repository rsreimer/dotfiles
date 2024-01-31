return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(buffer)
					local gs = package.loaded.gitsigns

					vim.keymap.map("n", "]h", gs.next_hunk, { buffer = buffer, desc = "Next Hunk" })
					vim.keymap.map("n", "[h", gs.prev_hunk, { buffer = buffer, desc = "Prev Hunk" })

					vim.keymap.map("n", "<leader>gb", function()
						gs.blame_line({ full = true })
					end, { buffer = buffer, desc = "Blame Line" })
				end,
			})
		end,
	},
}
