local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

local on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  vim.keymap.set("n", "]c", function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end,
    { buffer = bufnr, expr = true }
  );

  vim.keymap.set("n", "[c", function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end,
    { buffer = bufnr, expr = true }
  );

  vim.keymap.set("n", "<leader>gd", gs.diffthis, { });
end

gitsigns.setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "▎" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
  },
  max_file_length = 4000,
  on_attach = on_attach,
})

vim.keymap.set("n", "<leader>vh", ":Gitsigns preview_hunk_inline<CR>", { silent = true })

