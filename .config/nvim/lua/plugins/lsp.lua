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
          "emmet_language_server",

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
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local bmap = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
          end

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          bmap("n", "K", vim.lsp.buf.hover, "Hover")
          bmap({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

          bmap("n", "gd", vim.lsp.buf.definition, "Definition")
          bmap("n", "gD", vim.lsp.buf.type_definition, "Type Definition")
          bmap("n", "gi", vim.lsp.buf.implementation, "Implementation")
          bmap("n", "gr", vim.lsp.buf.references, "References")
          bmap("n", "gl", vim.diagnostic.open_float, "Open Float")

          bmap("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
          bmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
          bmap("n", "<leader>ci", function()
            vim.lsp.buf.code_action({
              apply = true,
              context = {
                only = { "source.addMissingImports.ts" },
              },
            })
          end, "Add Missing Imports")
          bmap("n", "<leader>cu", function()
            vim.lsp.buf.code_action({
              apply = true,
              context = {
                only = { "source.removeUnusedImports.ts" },
              },
            })
          end, "Removed Unused Imports")

          bmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
          bmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
        end,
      })
    end,
  },
}
