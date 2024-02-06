return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame_opts = {
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "<leader>ghB", function() gs.blame_line({ full = true }) end, "Blame Details")
        map("n", "<leader>ghb", function() gs.toggle_current_line_blame() end, "Toggle Blame")
      end,
    },
  },
}
