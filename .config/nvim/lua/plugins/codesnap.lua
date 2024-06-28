return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave" },
  keys = {
    {
      "<leader>cs",
      function()
        require("core.utils.table")
        local static = require("codesnap.static")

        local config = vim.tbl_extend("force", static.config, {
          code_file_path = vim.fn.expand("%:p"),
          save_path = vim.fn.expand("%:p") .. ".png",
          code = table.concat(vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false), "\n"),
          fonts_folder = static.cwd .. "/assets/fonts",
          themes_folder = static.cwd .. "/assets/themes",
          theme = "base16-onedark",
          file_path = "",
          start_line_number = nil,
        })

        require("codesnap").save_snapshot_with_config(config)
      end,
      mode = "n",
      desc = "Save screenshot of file",
    },
  },
  opts = {
    mac_window_bar = false,
    code_font_family = "JetBrains Mono",
    bg_color = "#ffffff",
    save_path = "~/Downloads",
    title = "",
    watermark = "",
  },
}
