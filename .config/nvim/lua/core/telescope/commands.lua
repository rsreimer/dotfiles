local M = {}

M.find_directory_command = {
	"fd",
	"--type=d",
	"--hidden",
	"--color=never",
	"--hidden",
	"--no-ignore",
	"--exclude=.git/",
	"--exclude=.idea/",
	"--exclude=node_modules/",
	"--exclude=dist/",
	"--exclude=.nx/cache/",
	"--exclude=.angular/cache/",
}

M.find_command = {
	"rg",
	"--files",
	"--smart-case",
	"--hidden",
	"--no-ignore",
	"--glob=!.git/",
	"--glob=!.idea/",
	"--glob=!node_modules/",
	"--glob=!dist/",
	"--glob=!.nx/cache/",
	"--glob=!.angular/cache/",
}

M.grep_command = {
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
	"--glob=!.idea/",
	"--glob=!node_modules/",
	"--glob=!dist/",
	"--glob=!.nx/cache/",
	"--glob=!.angular/cache/",
}

return M
