return {
  "ThePrimeagen/harpoon",
  lazy = true,
  enabled = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("harpoon").setup({
      menu = {
        width = math.min(vim.api.nvim_win_get_width(0) - 4, 100),
      },
    })
  end,
    -- stylua: ignore
    keys = {
      { "<leader>a", function () require("harpoon.mark").add_file() end, { desc = "Add harpoon" }, },
      { "<c-f>", function () require('harpoon.ui').toggle_quick_menu() end, { desc = "Toggle harpoon menu" } },

      { "<c-j>", function () require('harpoon.ui').nav_file(1) end, { desc = "Harpoon 1" } },
      { "<c-k>", function () require('harpoon.ui').nav_file(2) end, { desc = "Harpoon 2" } },
      { "<c-l>", function () require('harpoon.ui').nav_file(3) end, { desc = "Harpoon 3" } },
      { "<c-;>", function () require('harpoon.ui').nav_file(4) end, { desc = "Harpoon 4" } },
    },
}
