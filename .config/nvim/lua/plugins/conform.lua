return {
	"stevearc/conform.nvim",
	opts = {
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

			yaml = { "prettierd" },
		},
		format_on_save = {
			timeout_ms = 2000,
			lsp_fallback = true,
		},
	},
}
