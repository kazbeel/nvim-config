local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

illuminate.configure({
  delay = 250,
})

vim.g.Illuminate_ftblacklist = { 'NvimTree' }

vim.keymap.set("n", "]]", function() require("illuminate").goto_next_reference(true) end, {})
vim.keymap.set("n", "[[", function() require("illuminate").goto_prev_reference(true) end, {})

-- Used in lsp/handlers.lua
