local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end

auto_session.setup({
  auto_save_enabled = true,
  auto_restore_enabled = true,
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"