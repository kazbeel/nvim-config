local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
	diagnostics.yamllint.with({
		args = { "-c", os.getenv("HOME") .. "/.config/yamllint/config", "--format", "parsable", "-" },
	}),
	diagnostics.hadolint, -- Dockerfile
	diagnostics.shellcheck.with({
		filetypes = { "bash", "csh", "ksh", "sh", "zsh" },
	}),

	formatting.prettierd,
	formatting.stylua,
	formatting.markdownlint,
	formatting.shfmt.with({
		filetypes = { "bash", "csh", "ksh", "sh", "zsh" },
	}),

	code_actions.gitsigns,
	code_actions.shellcheck.with({
		filetypes = { "bash", "csh", "ksh", "sh", "zsh" },
	}),
}

local on_attach = function(client, bufnr)
	-- Format code on file save
	if client.supports_method("textDocument/formatting") then
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
