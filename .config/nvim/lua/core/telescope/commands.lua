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
  "--exclude=.nx/",
  "--exclude=.angular/",
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
  "--glob=!.nx/",
  "--glob=!.angular/",
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
  "--glob=!.nx/",
  "--glob=!.angular/",
}

return M
