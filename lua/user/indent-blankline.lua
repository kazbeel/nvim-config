local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

indent_blankline.setup({
	exclude = {
		filetype = {
			"NvimTree",
			"terminal",
			"toggleterm",
			"mason",
			"notify",
		},
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
	},
})
