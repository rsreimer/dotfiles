return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({}),
        },
      })
    end,
    keys = {
      {
        "<leader>tt",
        function()
          local neotest = require("neotest")

          local file = vim.fn.expand("%:p"):gsub(".spec.ts$", ".ts"):gsub(".ts$", ".spec.ts")

          neotest.run.run(file)

          neotest.summary.open()
          neotest.summary:expand(file, true)
        end,

        desc = "Run File",
      },
      {
        "<leader>tf",
        function()
          local file = vim.fn.expand("%")

          if file:match(".spec.ts$") then
            vim.cmd("edit " .. file:gsub(".spec.ts$", ".ts"))
          else
            vim.cmd("edit " .. file:gsub(".ts$", ".spec.ts"))
          end
        end,
        desc = "Switch to/from spec file",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Show Output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
    },
  },
}
