local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    close_command = "Bdelete! %d",
    middle_mouse_command = "Bdelete! %d",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = false,
      },
    },
    show_buffer_close_icons = false,
    show_buffer_default_icon = false,
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    separator_style = "slant",
  },
})

vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { silent = true })
vim.keymap.set("n", "<leader>bx", ":Bdelete<CR>", { silent = true })
vim.keymap.set("n", "<b", ":BufferLineMovePrev<CR>", { silent = true })
vim.keymap.set("n", ">b", ":BufferLineMoveNext<CR>", { silent = true })
