-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
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

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Go to the last location when opening a buffer
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
})

-- Set relative number only in focused window and when in normal mode
-- Translated autocommands of "numbertoggle"
-- https://github.com/jeffkreeftmeijer/vim-numbertoggle
vim.api.nvim_create_augroup("ToggleRelativeNumbers", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = "ToggleRelativeNumbers",
  pattern = "*",
  callback = function()
    if vim.opt.number and vim.api.nvim_get_mode()["mode"] ~= "i" then
      if vim.bo[0].filetype ~= "NvimTree" then
        vim.opt.relativenumber = true
      end
    end
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = "ToggleRelativeNumbers",
  pattern = "*",
  callback = function()
    if vim.opt.number then
      vim.opt.relativenumber = false
    end
  end
})
