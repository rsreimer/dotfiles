local dir = require("core.telescope.pickers.directory")
local builtin = require("telescope.builtin")

local find_directory_command = {
	"fd",
	"--type=d",
	"--hidden",
	"--color=never",
	"--hidden",
	"--no-ignore",
	"--exclude=.git/",
	"--exclude=node_modules/",
	"--exclude=dist/",
	"--exclude=.nx/cache/",
	"--exclude=.angular/cache/",
}

local find_command = {
	"rg",
	"--files",
	"--smart-case",
	"--hidden",
	"--no-ignore",
	"--glob=!.git/",
	"--glob=!node_modules/",
	"--glob=!dist/",
	"--glob=!.nx/cache/",
	"--glob=!.angular/cache/",
}

local vimgrep_arguments = {
	"rg",
	"--color=never",
	"--no-heading",
	"--with-filename",
	"--line-number",
	"--column",
	"--smart-case",
	"--hidden",
	"--no-ignore",
	"--glob=!.git/",
	"--glob=!node_modules/",
	"--glob=!dist/",
	"--glob=!.nx/cache/",
	"--glob=!.angular/cache/",
}
