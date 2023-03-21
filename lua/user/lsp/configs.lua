local lspconfig = require("lspconfig")

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

local servers = {
	"bashls",
	"dockerls",
	"eslint",
	"graphql",
	"jsonls",
	"marksman",
	"prismals",
	"sqlls",
	"lua_ls",
	"tsserver",
	"yamlls",
}

local tools = {
	"stylua",
	"prettierd",
}

local to_install = {}
local n = 0
for _, v in ipairs(servers) do
	n = n + 1
	to_install[n] = v
end
for _, v in ipairs(tools) do
	n = n + 1
	to_install[n] = v
end

mason_lspconfig.setup({
	ensure_installed = to_install,
	automatic_installation = true,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end

	lspconfig[server].setup(opts)
end
