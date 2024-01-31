return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
					vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev Hunk" })

					vim.keymap.set("n", "<leader>gb", function()
						gs.blame_line({ full = true })
					end, { buffer = bufnr, desc = "Blame Line" })
				end,
			})
		end,
	},
}
