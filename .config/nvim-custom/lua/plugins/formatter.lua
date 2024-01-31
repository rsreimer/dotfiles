return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },

				zsh = { "shfmt" },
				sh = { "shfmt" },

				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },

				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },

				css = { "prettierd" },
				scss = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },

				markdown = { "prettierd" },

				yaml = { "prettierd" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					timeout_ms = 3000,
				})
			end,
		})
	end,
}
