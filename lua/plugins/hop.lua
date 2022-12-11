local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup()

vim.keymap.set("n", "<leader><leader>b", ":HopWordBC<CR>", {})
vim.keymap.set("n", "<leader><leader>w", ":HopWordAC<CR>", {})
vim.keymap.set("n", "<leader><leader>l", ":HopLineStart<CR>", {})
