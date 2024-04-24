return {
	"echasnovski/mini.bufremove",
	keys = {
		{
			"<leader>bd",
			function()
				if vim.bo.modified then
					vim.cmd.write()
				end

				require("mini.bufremove").delete(0)
			end,
			desc = "Delete Buffer",
		},
	},
}
