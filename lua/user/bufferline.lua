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
				text = function()
					return "󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				text_align = "center",
				separator = false,
			},
		},
		show_buffer_close_icons = false,
		show_buffer_default_icon = false,
		show_close_icon = false,
		diagnostics = "nvim_lsp",
		separator_style = "thick",
		hover = { enabled = false },
		sync_root_with_cwd = true,
	},
})

set_keymap("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick buffer to go in buffer line" })
set_keymap(
	"n",
	"<leader>b<",
	":BufferLineMovePrev<CR>",
	{ desc = "Move current buffer to the left in the buffer line" }
)
set_keymap(
	"n",
	"<leader>b>",
	":BufferLineMoveNext<CR>",
	{ desc = "Move current buffer to the right in the buffer line" }
)
