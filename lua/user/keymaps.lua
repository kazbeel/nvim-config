-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",

--   command_mode = "c",-- Shorten keymap function
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Remap <space> as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Exit insert mode faster
keymap("i", "jk", "<Esc>", opts)

keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "ZA", ":qa<CR>", opts)

-- Better cursor motion when within wrapped lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)

keymap("n", "H", "g^", opts)
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "L", "g$", opts)

keymap("v", "H", "g^", opts)
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("v", "L", "g$", opts)

keymap("n", "<leader>J", "J", opts)

-- Add empty line above/below the current line
keymap("n", "<leader>O", "O<Esc>", opts)
keymap("n", "<leader>o", "o<Esc>", opts)

-- Yank to the end of the line (same as "C" and "D")
keymap("n", "Y", "yg_", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
keymap("n", "<leader>bq", ":q<CR>", opts)

-- No highlight of search text
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-S-h>", ":resize -5<CR>", opts)
keymap("n", "<C-S-k>", ":resize +5<CR>", opts)
keymap("n", "<C-S-h>", ":vertical resize -5<CR>", opts)
keymap("n", "<C-S-l>", ":vertical resize +5<CR>", opts)
