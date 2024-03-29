local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}

	vim.lsp.buf.execute_command(params)
end

return {
	preferences = {
		importModuleSpecifierPreference = "project-relative",
	},
	commands = {
		TSLspOrganize = {
			organize_imports,
			description = "Organize Imports",
		},
	},
}
