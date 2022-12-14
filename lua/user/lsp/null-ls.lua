local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
  diagnostics.eslint_d,
  diagnostics.yamllint,

  formatting.prettierd,
  formatting.stylua,

  code_actions.eslint_d,
  code_actions.gitsigns,
}

-- local on_attach = function(client, bufnr)
--   local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
--   -- Format code on file save
--   if client.supports_method("textDocument/formatting") then
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--         vim.lsp.buf.formatting_sync()
--       end,
--     })
--   end
-- end

null_ls.setup({
  sources = sources,
  -- on_attach = on_attach,
})

