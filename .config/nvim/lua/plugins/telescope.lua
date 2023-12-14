local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "rsreimer/magnet.nvim",
        config = function()
          require("telescope").load_extension("magnet")
        end,
      },
    },
    keys = {
      -- files
      { "<leader><leader>", "<cmd>lua require('telescope').extensions.magnet.find_file()<cr>", desc = "Find Files" },
      { "<leader>sf", "<cmd>lua require('telescope').extensions.magnet.find_file()<cr>", desc = "Find Files" },
      {
        "<leader>sF",
        "<cmd>lua require('telescope').extensions.magnet.find_file({ pick_dir = true })<cr>",
        desc = "Find Files in Directory",
      },

      -- grep
      {
        "<leader>sg",
        "<cmd>lua require('telescope').extensions.magnet.find_text()<cr>",
        desc = "Grep",
      },
      {
        "<leader>sG",
        "<cmd>lua require('telescope').extensions.magnet.find_text({ pick_dir = true })<cr>",
        desc = "Grep in Directory",
      },

      -- Errors and diagnostics
      { "<leader>se", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
      { "<leader>sE", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics (Workspace)" },

      -- symbols
      {
        "<leader>ss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
            "Enum",
            "Constant",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
            "Enum",
            "Constant",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
    },
  },
}
