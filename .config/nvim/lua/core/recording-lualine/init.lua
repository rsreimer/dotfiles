local M = {}

function M.setup_autocmds()
  local lualine = require("lualine")

  vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
      lualine.refresh()
    end,
  })

  vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
      -- vim.fn.reg_recording is updated shortly after the RecordingLeave event, so we have to wait a short time before calling lualine.refresh()
      vim.loop.new_timer():start(
        50,
        0,
        vim.schedule_wrap(function()
          lualine.refresh({
            place = { "statusline" },
          })
        end)
      )
    end,
  })
end

function M.show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

return M
