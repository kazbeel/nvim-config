local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs,
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

  vim.diagnostic.config(config)

  local float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
  }

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
  vim.keymap.set("n", "<C-k>", ":lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "<M-S-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "<F12>", ":lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
  vim.keymap.set("n", "gfc", ":lua vim.lsp.buf.formatting({ async = true })<CR>", opts)
  vim.keymap.set("n", "gca", ":lua vim.lsp.buf.code_action()<CR>", opts)
  vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev<CR>", opts)
  vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next<CR>", opts)
  vim.keymap.set("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", opts)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.on_attach = function(client, bufnr)
  -- Configure specific LSP server
  if client.name == "tsserver" then
    -- null_ls and prettier will format the code
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  if client.name == "sumneko_lua" then
    -- null_ls and prettier will format the code
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  if client.name == "jsonls" then
    -- null_ls and prettier will format the code
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  -- Format code on save
  if client.server_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end

  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  M.capabilities.experimental = {}
  M.capabilities.experimental.hoverActions = true

  lsp_keymaps(bufnr)

  -- Highlight other uses of the current word under the cursor
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end

  illuminate.on_attach(client)

  -- Show line diagnostics automatically when cursor on the time
  -- This does not make much sense if config.virtual_text = true since the message is always displayed
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function ()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = "",
        scope = "cursor",
      }

      -- vim.diagnostic.open_float(nil, opts)
      vim.diagnostic.open_float()
    end
  })
end

return M
