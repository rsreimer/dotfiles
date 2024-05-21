return {
  {
    "zbirenbaum/copilot.lua",
    name = "copilot",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  { "zbirenbaum/copilot-cmp", dependencies = "copilot", opts = {} },
}
