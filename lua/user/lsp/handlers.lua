local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.setup = function()
	local diagnosticSigns = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "󰌵" },
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
	-- "gD" is defined in treesitter textobjects
	-- set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr, desc = "Go to declaration (LSP)" })
	set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "Go to definition (LSP)" })
	set_keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", { buffer = bufnr, desc = "Hover information (LSP)" })
	set_keymap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr, desc = "Signature help (LSP)" })
	set_keymap(
		"n",
		"gi",
		":lua vim.lsp.buf.implementation()<CR>",
		{ buffer = bufnr, desc = "Go to implementation (LSP)" }
	)
	set_keymap(
		"n",
		"<F12>",
		":lua vim.lsp.buf.references()<CR>",
		{ buffer = bufnr, desc = "Go to references or list them if multiple (LSP)" }
	)
	set_keymap(
		"n",
		"gl",
		":lua vim.diagnostic.open_float()<CR>",
		{ buffer = bufnr, desc = "Show line diagnostic in floating window (LSP)" }
	)
	set_keymap(
		"n",
		"gfc",
		":lua vim.lsp.buf.format({ async = true })<CR>",
		{ buffer = bufnr, desc = "Format document (LSP)" }
	)
	set_keymap("n", "gca", ":lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr, desc = "Code actions (LSP)" })
	set_keymap(
		"n",
		"[d",
		":lua vim.diagnostic.goto_prev({ wrap = true })<CR>",
		{ buffer = bufnr, desc = "Go to previous diagnostic (LSP)" }
	)
	set_keymap(
		"n",
		"]d",
		":lua vim.diagnostic.goto_next({ wrap = true })<CR>",
		{ buffer = bufnr, desc = "Go to declaration (LSP)" }
	)
	set_keymap("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", { buffer = bufnr, desc = "Go to next diagnostic (LSP)" })

	set_keymap(
		"n",
		"<F10>",
		":lua vim.lsp.buf.type_definition()<CR>",
		{ buffer = bufnr, desc = "Go to type definition (LSP)" }
	)
	-- vim.cmd([[ command! Format execute "lua vim.lsp.buf.format({ async = true })" ]])
end

local function lsp_highlight_document(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if status_ok then
		illuminate.on_attach(client)
	end
end

M.on_attach = function(client, bufnr)
	-- By default, formatting capabilities are disabled in favor of formatters
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	if client.name == "yamlls" then
		-- By default this LSP has formatting provider set to false
		-- See https://github.com/redhat-developer/yaml-language-server/issues/486
		client.server_capabilities.documentFormattingProvider = true
		client.server_capabilities.documentRangeFormattingProvider = true
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
end

return M
