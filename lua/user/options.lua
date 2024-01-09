vim.cmd("filetype plugin indent on")

vim.opt.mouse = "a"
vim.opt.syntax = "on"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.updatetime = 250

vim.opt.conceallevel = 0
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.pumheight = 10
vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.termguicolors = true
vim.opt.laststatus = 3 -- Global status line
vim.opt.showmode = false
vim.opt.ruler = false

vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 3
vim.opt.cursorline = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fillchars = { eob = " " }

vim.opt.undofile = true
vim.opt.undodir = "/tmp"

vim.opt.spellfile = "~/.config/nvim/spell/en.utf-8.add"

vim.opt.wildignore = vim.opt.wildignore + {
	"*/.svn/*",
	"*/.git/*",
	"*/node_modules/*",
	"*.DS_Store",
}

-- Useful for which-key
vim.opt.timeout = true
vim.opt.timeoutlen = 400

-- Use ripgrep
vim.o.grepprg = 'rg --vimgrep'

-- Disable health checks
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
