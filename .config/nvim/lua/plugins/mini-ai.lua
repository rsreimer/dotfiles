return {
  "echasnovski/mini.ai",
  opts = function()
    local ai = require("mini.ai")

    return {
      n_lines = 500,
      custom_textobjects = {
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        t = { "<([%w_-]-)%f[^<%w_-][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        g = function()
          return {
            from = { line = 1, col = 1 },
            to = {
              line = vim.fn.line("$"),
              col = math.max(vim.fn.getline("$"):len(), 1),
            },
          }
        end,
      },
    }
  end,
  dependencies = {
    "which-key/which-key.nvim",
    config = function()
      -- register all text objects with which-key
      local desc = {
        [" "] = "Whitespace",
        ['"'] = 'Balanced "',
        ["'"] = "Balanced '",
        ["`"] = "Balanced `",
        ["("] = "Balanced (",
        [")"] = "Balanced )",
        [">"] = "Balanced >",
        ["<lt>"] = "Balanced <",
        ["]"] = "Balanced ]",
        ["["] = "Balanced [",
        ["}"] = "Balanced }",
        ["{"] = "Balanced {",
        ["?"] = "User Prompt",
        _ = "Underscore",
        a = "Argument",
        b = "Balanced ), ], }",
        c = "Class",
        f = "Function",
        o = "Block, conditional, loop",
        q = "Quote `, \", '",
      }

      require("which-key").register({
        mode = { "o", "x" },
        i = desc,
        a = desc,
      })
    end,
  },
}
