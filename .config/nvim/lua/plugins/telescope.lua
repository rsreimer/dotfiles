return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/plenary.nvim",
    },
    opts = {
      pickers = {
        buffers = {
          sort_mru = true,
          mappings = {
            n = { ["dd"] = "delete_buffer" },
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("noice")
    end,
    keys = function()
      local core_finders = require("core.telescope.finders")

      -- stylua: ignore start
      return {
        { "<leader><leader>", function() core_finders.find_file() end, desc = "Find Files" },
        { "<leader>sf", function() core_finders.find_file() end, desc = "Find Files" },
        { "<leader>sF", function() core_finders.find_file_in_dir() end, desc = "Find Files In Directory" },
        { "<leader>sd", function() core_finders.find_directory() end, desc = "Find Directories" },
        { "<leader>sg", function() core_finders.find_text() end, desc = "Grep" },
        { "<leader>sG", function() core_finders.find_text_in_dir() end, desc = "Grep in Directory" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
        { "<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
        { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
        { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume Search" },
        { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
        { "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Symbols" },
        { "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
      }
    end,
  },
}
