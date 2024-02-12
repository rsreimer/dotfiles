return {
	"RRethy/vim-illuminate",
	keys = {
		{
			"]]",
			function()
				require("illuminate").goto_next_reference()
			end,
			desc = "Next Reference",
		},
		{
			"[[",
			function()
				require("illuminate").goto_prev_reference()
			end,
			desc = "Prev Reference",
		},
	},
	opts = {
		delay = 200,
		large_file_cutoff = 2000,
		large_file_overrides = {
			providers = { "lsp" },
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
