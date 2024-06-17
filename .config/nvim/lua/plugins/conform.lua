return {
  "stevearc/conform.nvim",
  lazy = false,
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
    format_on_save = function()
      if vim.b.disable_autoformat then
        return
      end

      return {
        timeout_ms = 2000,
        lsp_fallback = true,
      }
    end,
  },
  config = function(_, opts)
    local conform = require("conform")

    conform.setup(opts)

    vim.api.nvim_create_user_command("Format", function()
      conform.format({ async = true, lsp_fallback = true })
    end, {})
  end,
  keys = {
    {
      "<leader>uf",
      function()
        if vim.b.disable_autoformat then
          vim.b.disable_autoformat = false
          vim.print("Enabled autoformat for buffer")
        else
          vim.b.disable_autoformat = true
          vim.print("Disabled autoformat for buffer")
        end
      end,
      desc = "Toggle auto format",
    },
  },
}
