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
      {
        "<leader><leader>",
        function()
          require("telescope").extensions.magnet.find_file({
            hidden = true,
          })
        end,
        desc = "Find Files",
      },
      {
        "<leader>sf",
        function()
          require("telescope").extensions.magnet.find_file({
            hidden = true,
          })
        end,
        desc = "Find Files",
      },
      {
        "<leader>sF",
        function()
          require("telescope").extensions.magnet.find_file({
            hidden = true,
            pick_dir = true,
          })
        end,
        desc = "Find Files In Directory",
      },

      -- grep
      {
        "<leader>sg",
        function()
          require("telescope").extensions.magnet.find_text({
            vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--hidden",
              "--glob=!.git",
            },
          })
        end,
        desc = "Grep",
      },
      {
        "<leader>sG",
        function()
          require("telescope").extensions.magnet.find_text({
            vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--hidden",
              "--glob=!.git",
            },
            pick_dir = true,
          })
        end,
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
