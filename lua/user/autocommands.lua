-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "fugitive" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Set maximum text length in gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit" },
	callback = function()
		vim.opt_local.textwidth = 72
	end,
})

-- Disable autocomment new lines
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	command = "setlocal formatoptions-=cro",
})

-- Go to the last location when opening a buffer
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
})

-- Set relative number only in focused window and when in normal mode
-- Translated autocommands of "numbertoggle"
-- https://github.com/jeffkreeftmeijer/vim-numbertoggle
local toggle_relative_number_group = vim.api.nvim_create_augroup("ToggleRelativeNumbers", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	group = toggle_relative_number_group,
	pattern = "*",
	callback = function()
		if vim.o.number and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	group = toggle_relative_number_group,
	pattern = "*",
	callback = function()
		if vim.o.number then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})

local disable_node_modules_eslint_group = vim.api.nvim_create_augroup("DisableNodeModulesEslint", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = disable_node_modules_eslint_group,
	pattern = { "**/node_modules/**", "node_modules", "/node_modules/**" },
	callback = function()
		vim.diagnostic.disable()
	end,
})
