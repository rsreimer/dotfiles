return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    skip_confirm_for_simple_edits = true,
    view_options = {
      is_hidden_file = function(name)
        return name == ".git"
      end,
    },
    keymaps = {
      ["h"] = "actions.parent",
      ["l"] = "actions.select",

      ["q"] = "actions.close",
      ["<leader>e"] = "actions.close",
    },
  },
  keys = {
    { "<leader>e", "<cmd>Oil<cr>", desc = "File explorer" },
  },
}
