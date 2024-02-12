return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"haydenmeade/neotest-jest",
		},
		config = function()
			local neotest = require("neotest")

			neotest.setup({
				adapters = {
					require("neotest-jest")({}),
				},
			})

			vim.keymap.set("n", "<leader>tt", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Run File" })

			vim.keymap.set("n", "<leader>tT", function()
				neotest.run.run(vim.loop.cwd())
			end, { desc = "Run All" })

			vim.keymap.set("n", "<leader>ts", function()
				neotest.summary.toggle()
			end, { desc = "Toggle Summary" })

			vim.keymap.set("n", "<leader>to", function()
				neotest.output.open({ enter = true, auto_close = true })
			end, { desc = "Show Output" })

			vim.keymap.set("n", "<leader>tO", function()
				neotest.output_panel.toggle()
			end, { desc = "Toggle Output Panel" })
		end,
	},
}
