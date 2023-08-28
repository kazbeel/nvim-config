local autocmd = vim.api.nvim_create_autocmd

local function augroup(name, fnc)
	fnc(vim.api.nvim_create_augroup(name, { clear = true }))
end

-- Use 'q' to quit from common plugins
augroup("QuitWithQ", function(group)
	autocmd({ "FileType" }, {
		group = group,
		pattern = { "qf", "help", "man", "lspinfo", "lir", "fugitive" },
		callback = function()
			vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
		end,
	})
end)

-- Set wrap and spell in markdown and gitcommit
augroup("ActivateWrapAndSpell", function(group)
	autocmd({ "FileType" }, {
		group = group,
		pattern = { "gitcommit", "markdown" },
		callback = function()
			vim.opt_local.wrap = true
			vim.opt_local.spell = true
		end,
	})
end)

-- Set maximum text length in gitcommit
augroup("GitCommitMaxLength", function(group)
	autocmd({ "FileType" }, {
		group = group,
		pattern = { "gitcommit" },
		callback = function()
			vim.opt_local.textwidth = 72
		end,
	})
end)

-- Disable autocomment new lines
augroup("DisableAutocomment", function(group)
	autocmd({ "BufEnter" }, {
		group = group,
		pattern = "*",
		command = "setlocal formatoptions-=cro",
	})
end)

-- Go to the last location when opening a buffer
augroup("GoLastCursorLocaltion", function(group)
	autocmd({ "BufReadPost" }, {
		group = group,
		pattern = "*",
		command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
	})
end)

-- Set relative number only in focused window and when in normal mode
-- Translated autocommands of "numbertoggle"
-- https://github.com/jeffkreeftmeijer/vim-numbertoggle
local toggle_relative_number_group = vim.api.nvim_create_augroup("ToggleRelativeNumbers", { clear = true })
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	group = toggle_relative_number_group,
	pattern = "*",
	callback = function()
		if vim.o.number and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})
autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	group = toggle_relative_number_group,
	pattern = "*",
	callback = function()
		if vim.o.number then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})

-- Disable eslint when in a node_modules source file
augroup("DisableNodeModulesEslint", function(group)
	autocmd({ "BufNewFile", "BufRead" }, {
		group = group,
		pattern = { "**/node_modules/**", "node_modules", "/node_modules/**" },
		callback = function()
			vim.diagnostic.disable()
		end,
	})
end)

-- Resize windows
augroup("ResizeWindows", function(group)
	autocmd("VimResized", {
		group = group,
		pattern = "*",
		command = "tabdo wincmd =",
	})
end)
