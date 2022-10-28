local status_ok, git_conflict = pcall(require, "git-conflict")
if not status_ok then
  return
end

git_conflict.setup({
  default_mappings = true,
  disable_diagnostics = true,
})

vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)')
