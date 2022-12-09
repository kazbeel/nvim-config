vim.cmd('filetype plugin indent on')

-- vim.opt.showmode = false
-- vim.opt.hidden = true
-- vim.opt.timeoutlen = 1000
-- vim.opt.fillchars = { eob = " " }
-- vim.opt.cursorlineopt = "number"
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldnestmax = 100
-- vim.opt.foldenable = false
-- vim.opt.foldlevel = 2
-- vim.opt.winblend = 0

vim.opt.mouse = "a"                                     -- Enable the use of the mouse
vim.opt.syntax = "on"                                   -- Highlight code syntax
vim.opt.completeopt = { "menuone", "noselect" }         -- Options for insert mode completion
vim.opt.updatetime = 300                                -- Timeout after typing to trigger CursorHold
vim.opt.lazyredraw = true                               -- The screen will not be redrawn while executing macros

vim.opt.clipboard = "unnamedplus"     -- Neovim and System share the same clipboard
vim.opt.conceallevel = 0              -- How text with the "conceal" syntax is shown: (3) text is shown normally
vim.opt.encoding = "utf-8"            -- Character encoding used inside Vim
vim.opt.fileencoding = "utf-8"        -- Character encoding for the file
vim.opt.pumheight = 10                -- Max number of items to show in the popup menu
vim.opt.swapfile = false              -- Use a swap file for the buffer
vim.opt.backup = false                -- Make a backup before overwritting a file
vim.opt.writebackup = false           -- Make a temporary backup before overwritting a file

vim.opt.termguicolors = true          -- Uses highlight-guifg and highlight-guibg attributes in the terminal (24-bit color)
vim.opt.laststatus = 3                -- The last window will have a status line: (3) always and only the last window
vim.opt.ruler = false

vim.opt.number = true                   -- Print the line number
vim.opt.numberwidth = 3                 -- Minimal number of columns to use for the line number
vim.opt.relativenumber = true           -- Show the line number relative to the line with the cursor
vim.opt.signcolumn = "yes"              -- Whether or not to draw the signcolumn

vim.opt.scrolloff = 5                   -- Minimal number of screen line to keep above and below the cursor
vim.opt.sidescrolloff = 3               -- Minimak number of screen columns to keep to the left and right of the cursor
vim.opt.cursorline = true               -- Highlight the screen line of the cursor
vim.opt.wrap = false                    -- Lines longer than the width of the window will wrap and displaying continues on the next line

vim.opt.splitright = true               -- When splitting, put the new window right of the current
vim.opt.splitbelow = true               -- When splitting, put the new window below the current

vim.opt.smartindent = true              -- Do smart autoindenting when starting a new line

vim.opt.tabstop = 2                     -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 2                  -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true                -- Use the appropriate number of spaces to insert a <Tab>

vim.opt.ignorecase = true               -- Ignore case in search patterns
vim.opt.smartcase = true                -- Override the ignore case if the search patterns contains upper case chars

vim.opt.undofile = true                 -- Save undo history to an undo file
vim.opt.undodir = "/tmp"                -- Directory names for undo files

vim.opt.spellfile = "~/.config/nvim/spell/en.utf-8.add"

vim.opt.wildignore = vim.opt.wildignore + {
  "*/.snv/*",
  "*/.git/*",
  "*/node_modules/*",
  "*.DS_Store"
}
