-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",

-- Remap <space> as leader key
set_keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

set_keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

set_keymap("n", "<leader>w", ":w<CR>", { desc = "Save current buffer" })
set_keymap("n", "ZA", ":qa<CR>", { desc = "Exit vim unless there are unsaved buffers" })

-- Better cursor motion when within wrapped lines
set_keymap("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Mode down", expr = true })
set_keymap("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Mode up", expr = true })
set_keymap("v", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Mode down", expr = true })
set_keymap("v", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Mode up", expr = true })

set_keymap("n", "H", "g^")
set_keymap("n", "J", "5j")
set_keymap("n", "K", "5k")
set_keymap("n", "L", "g$")

set_keymap("v", "H", "g^")
set_keymap("v", "J", "5j")
set_keymap("v", "K", "5k")
set_keymap("v", "L", "g$")

set_keymap("n", "<leader>J", "J", { desc = "Join [count] lines" })

set_keymap("n", "<leader>O", "O<Esc>", { desc = "Add [count] empty line above" })
set_keymap("n", "<leader>o", "o<Esc>", { desc = "Add [count] empty line below" })

set_keymap("n", "Y", "yg_", { desc = "Yank to the end of the line" })

-- Navigate buffers
set_keymap("n", "<Tab>", ":bnext<CR>", { desc = "Go to next buffer" })
set_keymap("n", "<S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer" })
set_keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Unload and delete buffer" })
set_keymap("n", "<leader>bq", ":q<CR>", { desc = "Quit the current window" })

set_keymap("n", "<ESC>", ":nohlsearch<CR>", { desc = "Clear highlighs" })

set_keymap("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy the whole file" })

-- Keep cursor in the center
set_keymap("n", "<C-d>", "<C-d>zz")
set_keymap("n", "<C-u>", "<C-u>zz")
set_keymap("n", "n", "nzzzv")
set_keymap("n", "N", "Nzzzv")

-- Better window navigation
set_keymap("n", "<C-h>", "<C-w>h", { desc = "Focus on the window on the left" })
set_keymap("n", "<C-j>", "<C-w>j", { desc = "Focus on the window below" })
set_keymap("n", "<C-k>", "<C-w>k", { desc = "Focus on the window above" })
set_keymap("n", "<C-l>", "<C-w>l", { desc = "Focus on the window on the right" })

-- Resize windows
set_keymap("n", "<C-Up>", ":resize -5<CR>", { desc = "Make window taller 5 lines up" })
set_keymap("n", "<C-Down>", ":resize +5<CR>", { desc = "Make window taller 5 lines down" })
set_keymap("n", "<C-Left>", ":vertical resize -5<CR>", { desc = "Make window wider 5 columns to the right" })
set_keymap("n", "<C-Right>", ":vertical resize +5<CR>", { desc = "Make window wider 5 columns to the left" })

-- Search and Replace
set_keymap("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Search and replace word under cursor" })
