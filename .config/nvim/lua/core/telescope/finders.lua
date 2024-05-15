local builtin = require("telescope.builtin")
local dir = require("core.telescope.pickers.directory")
local grep = require("core.telescope.pickers.grep")
local commands = require("core.telescope.commands")

local M = {}

function M.find_directory()
	local opts = {
		find_directory_command = commands.find_directory_command,
	}

	dir.picker(opts, function(dirs)
		vim.cmd("e " .. dirs[1])
	end)
end

function M.find_text()
	local opts = {
		vimgrep_arguments = commands.grep_command,
	}

	grep.picker(opts)
end

function M.find_text_in_dir()
	local opts = {
		vimgrep_arguments = commands.grep_command,
		find_directory_command = commands.find_directory_command,
	}

	dir.picker(opts, function(dirs)
		opts.search_dirs = dirs
		grep.picker(opts)
	end)
end

function M.find_file()
	local opts = {
		find_command = commands.find_command,
	}

	builtin.find_files(opts)
end

function M.find_file_in_dir()
	local opts = {
		find_command = commands.find_command,
		find_directory_command = commands.find_directory_command,
	}

	dir.picker(opts, function(dirs)
		opts.search_dirs = dirs
		builtin.find_files(opts)
	end)
end

return M
