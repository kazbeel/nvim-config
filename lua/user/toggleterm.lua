local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	open_mapping = [[<C-ñ>]],
	direction = "vertical",
	size = vim.o.columns * 0.25,
	shade_terminals = true,
	shading_factor = 2,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	set_keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Focus on the window on the left" })
	set_keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Focus on the window below" })
	set_keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Focus on the window above" })
	set_keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Focus on the window on the right" })
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Open Lazygit is a terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "double",
	},
})

function _Lazygit_toggle()
	lazygit:toggle()
end

set_keymap("n", "<leader>tg", "<cmd>lua _Lazygit_toggle()<CR>", { desc = "Toggle lazygit terminal" })
