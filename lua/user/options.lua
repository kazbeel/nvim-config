vim.cmd('filetype plugin indent on')

vim.opt.mouse = "a"
vim.opt.syntax = "on"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.updatetime = 300

vim.opt.conceallevel = 0
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.pumheight = 10
vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.termguicolors = true
vim.opt.laststatus = 3 -- Always and only the last window
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

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true
vim.opt.undodir = "/tmp"

vim.opt.spellfile = "~/.config/nvim/spell/en.utf-8.add"

vim.opt.wildignore = vim.opt.wildignore + {
  "*/.snv/*",
  "*/.git/*",
  "*/node_modules/*",
  "*.DS_Store"
}
