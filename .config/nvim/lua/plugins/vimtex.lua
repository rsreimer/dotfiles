return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  init = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "dist",
      options = {
        "-pdflatex=lualatex",
        "-shell-escape",
        "-pvc",
      },
    }
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtext" },
  },
}
