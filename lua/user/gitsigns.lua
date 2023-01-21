local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

local on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r)
    vim.keymap.set(mode, l, r, { buffer = bufnr, })
  end

  map("n", "]h", gs.next_hunk)
  map("n", "[h", gs.prev_hunk)
  map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>")
  map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>")
  map("n", "<leader>ghS", gs.stage_buffer)
  map("n", "<leader>ghu", gs.undo_stage_hunk)
  map("n", "<leader>ghR", gs.reset_buffer)
  map("n", "<leader>ghp", gs.preview_hunk)
  map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end)
  map("n", "<leader>ghd", gs.diffthis)
  map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

  -- vim.keymap.set("n", "]c", function()
  --     if vim.wo.diff then return ']c' end
  --     vim.schedule(function() gs.next_hunk() end)
  --     return '<Ignore>'
  --   end,
  --   { buffer = bufnr, expr = true }
  -- );
  --
  -- vim.keymap.set("n", "[c", function()
  --     if vim.wo.diff then return '[c' end
  --     vim.schedule(function() gs.prev_hunk() end)
  --     return '<Ignore>'
  --   end,
  --   { buffer = bufnr, expr = true }
  -- );
  --
  -- vim.keymap.set("n", "<leader>gd", gs.diffthis, { });
end

gitsigns.setup({
  current_line_blame = true,
  max_file_length = 4000,
  on_attach = on_attach,
})
