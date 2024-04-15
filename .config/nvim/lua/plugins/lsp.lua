return {
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = {
					-- LSPs
					"angularls",
					"bashls",
					"cssls",
					"html",
					"jsonls",
					"tsserver",
					"lua_ls",
					"yamlls",

					-- Formatters
					"prettierd",
					"stylua",
					"shfmt",

					-- Linters
					"eslint",

					-- DAPs
					"js-debug-adapter",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({})

			local cmp = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server)
					require("lspconfig")[server].setup({
						capabilities = cmp,
					})
				end,
				["angularls"] = function()
					require("lspconfig").angularls.setup({
						capabilities = cmp,
						root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
					})
				end,
				["tsserver"] = function()
					require("lspconfig").tsserver.setup({
						capabilities = cmp,
						keys = {
							{
								"<leader>cu",
								function()
									vim.lsp.buf.code_action({
										apply = true,
										context = {
											only = { "source.removeUnused.ts" },
											diagnostics = {},
										},
									})
								end,
								desc = "Remove Unused Imports",
							},
						},
					})
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local bmap = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = event.buf })
					end

					-- See `:help vim.lsp.*` for documentation on any of the below functions
					bmap("n", "K", vim.lsp.buf.hover)
					bmap({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)

					bmap("n", "gd", vim.lsp.buf.definition)
					bmap("n", "gD", vim.lsp.buf.type_definition)
					bmap("n", "gi", vim.lsp.buf.implementation)
					bmap("n", "gr", vim.lsp.buf.references)

					bmap("n", "<leader>cr", vim.lsp.buf.rename)
					bmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

					bmap("n", "gl", vim.diagnostic.open_float)
					bmap("n", "[d", vim.diagnostic.goto_prev)
					bmap("n", "]d", vim.diagnostic.goto_next)
				end,
			})
		end,
	},
}
