local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
	diagnostics.yamllint,

	formatting.prettierd,
	formatting.stylua,
	formatting.markdownlint,

	code_actions.gitsigns,
}

local on_attach = function(client, bufnr)
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	-- Format code on file save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, async = true })
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
