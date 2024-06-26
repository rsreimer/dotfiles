return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        -- LSPs
        "angularls",
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "vtsls",
        "lua_ls",
        "yamlls",
        "emmet_language_server",

        -- -- Formatters
        -- "prettierd",
        -- "stylua",
        -- "shfmt",
        --
        -- -- Linters
        -- "eslint",
        --
        -- -- DAPs
        -- "js-debug-adapter",
      },
    })

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
      ["vtsls"] = function()
        require("lspconfig").vtsls.setup({
          capabilities = cmp,
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
        })
      end,
    })

    --HACK: disable angular renaming capability due to duplicate rename popping up from tsserver
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client.name == "angularls" then
          client.server_capabilities.renameProvider = false
        end
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local bmap = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
        end

        bmap("n", "gd", vim.lsp.buf.definition, "Definition")
        bmap("n", "gD", vim.lsp.buf.type_definition, "Type Definition")
        bmap("n", "gi", vim.lsp.buf.implementation, "Implementation")
        bmap("n", "gl", vim.diagnostic.open_float, "Open Float")
        bmap("n", "K", vim.lsp.buf.hover, "Hover")
        bmap({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, "Signature Help")

        -- stylua: ignore start
        bmap("n", "grn", vim.lsp.buf.rename, "Rename")
        bmap("n", "gra", vim.lsp.buf.code_action, "Code Actions")
        bmap("n", "grr", vim.lsp.buf.references, "References")
        bmap("n", "gri", function() vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" } } }) end, "Add Missing Imports")
        bmap("n", "gru", function() vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnusedImports" } } }) end, "Removed Unused Imports")
        bmap("n", "grd", function() vim.lsp.buf.code_action({ apply = true, context = { only = { "source.fixAll.ts" } } }) end, "Fix all diagnostics")
        -- stylua: ignore end

        bmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
        bmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
      end,
    })
  end,
}
