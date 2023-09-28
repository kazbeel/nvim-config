local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

indent_blankline.setup({
	filetype_exclude = {
		"help",
		"NvimTree",
		"terminal",
		"toggleterm",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"mason",
		"notify",
	},
	buftype_exclude = { "terminal" },
	use_treesitter = true,
	use_treesitter_scope = true,
	show_trailing_blankline_indent = false,
	show_current_context = true,
})
