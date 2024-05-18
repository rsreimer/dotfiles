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
        {
          function()
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.mode.has()
          end,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_y = { "filetype" },
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
