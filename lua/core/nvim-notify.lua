local notify_ok, notify = pcall(require, "notify")
if notify_ok then
  notify.setup({
    stages = "fade",
  })

  vim.notify = notify
else
  local errorMessage = "Failed to load nvim-notify"
  notify(errorMessage, "error", { title = "Require Error" })
end

