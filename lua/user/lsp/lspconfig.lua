local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local servers = {
  "bashls",
  "dockerls",
  "eslint",
  "graphql",
  "html",
  "jsonls",
  "marksman",
  "prismals",
  "sqlls",
  "lua_ls",
  "tsserver",
  "yamlls",
}

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

for _, server in pairs(servers) do
  if server == "tsserver" then
    local tsserver_opts = require("user.lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "lua_ls" then
    local lua_ls_opts = require("user.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
  end

  if server == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  lspconfig[server].setup(opts)
end
