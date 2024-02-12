return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		dependencies = {
			{ "zbirenbaum/copilot-cmp", opts = {} },
		},
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
}
