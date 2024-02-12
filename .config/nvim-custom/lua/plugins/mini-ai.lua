return {
	"echasnovski/mini.ai",
	opts = {
		n_lines = 500,
	},
	dependencies = {
		"whick-key/which-key.nvim",
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
