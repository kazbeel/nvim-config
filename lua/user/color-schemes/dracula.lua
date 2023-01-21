local status_ok, dracula = pcall(require, "dracula")
if not status_ok then
  return
end

dracula.setup({
  transparent_bg = true,
  italic_comment = true,
})

