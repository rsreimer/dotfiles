return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "rsreimer/codeowners.nvim", opts = {} },
  },
  opts = {
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = {
        function()
          return require("codeowners").get_buf_owner()
        end,
      },
      lualine_y = {
        function()
          return require("core.recording-lualine").show_macro_recording()
        end,
        "filetype",
      },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_c = {
        function()
          return require("core.harpoon-lualine").get_lualine()
        end,
      },
    },
  },
}
