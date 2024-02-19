return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			-- LSPs
			"angularls",
			"bashls",
			"cssls",
			"html",
			"jsonls",
			"tsserver",
			"lua_ls",
			"marksman",
			"yamlls",

			-- Formatters
			"prettierd",
			"stylua",
			"shfmt",

			-- Linters
			"eslint_d",
			"markdownlint",

			-- DAPs
			"js-debug-adapter",
		},
	},
}
