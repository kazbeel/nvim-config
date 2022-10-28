local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end

local function restore_nvim_tree()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  nvim_tree.change_dir(vim.fn.getcwd())
  nvim_tree.refresh()
end

auto_session.setup({
  pre_save_cmds = { "NvimTreeClose" },
  post_restore_cmds = { restore_nvim_tree },
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_allowed_dirs = { "~/Workspace", "~/.config/nvim" },
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

