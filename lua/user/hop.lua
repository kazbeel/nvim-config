local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup()

set_keymap("n", "<leader><leader>b", ":HopWordBC<CR>", { desc = "Go to any word before the current cursor position" })
set_keymap("n", "<leader><leader>w", ":HopWordAC<CR>", {desc="Go to any word after the current cursor position"})
set_keymap("n", "<leader><leader>x", ":HopWord<CR>", {desc="Go to any word in the current buffer"})
