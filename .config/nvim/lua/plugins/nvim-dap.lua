return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    for _, language in ipairs({
      "json",
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }
    end
  end,
  keys = {
    -- goto
    { "<leader>dg", false },

    -- session
    { "<leader>ds", false },
  },
}
