local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.setup = function()
	local diagnosticSigns = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(diagnosticSigns) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local diagnosticConfig = {
		virtual_text = false,
		signs = {
			active = diagnosticSigns,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	local float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
	}

	-- Diagnostics
	-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
	-- 	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnosticConfig)
	vim.diagnostic.config(diagnosticConfig)

	-- Object references
	local on_references = vim.lsp.handlers["textDocument/references"]
	vim.lsp.handlers["textDocument/references"] = vim.lsp.with(on_references, { loclist = true, virtual_text = true })

	-- Hover configuration
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)

	-- Signature Help
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "<F12>", ":lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "gfc", ":lua vim.lsp.buf.format({ async = true })<CR>", opts)
	vim.keymap.set("n", "gca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev({ wrap = true })<CR>", opts)
	vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next({ wrap = true })<CR>", opts)
	vim.keymap.set("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", opts)

	vim.keymap.set("n", "<F10>", ":lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.cmd([[ command! Format execute "lua vim.lsp.buf.format({ async = true })" ]])
end

local function lsp_highlight_document(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if status_ok then
		illuminate.on_attach(client)
	end
end

M.on_attach = function(client, bufnr)
	-- Configure specific LSP server
	if client.name == "tsserver" then
		-- prettier will format the code
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	if client.name == "lua_ls" then
		-- stylua will format the code
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	if client.name == "jsonls" then
		-- prettier will format the code
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	-- Format code on save
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)

	-- Show line diagnostics automatically when cursor on the time
	-- This does not make sense if config.virtual_text = true since the message is always displayed
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				style = "minimal",
				border = "rounded",
				source = "always",
				prefix = "",
				scope = "cursor",
			}

			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}
M.capabilities.experimental = {
	hoverActions = true,
}

return M
