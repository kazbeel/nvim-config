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
  map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
  map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
  map("n", "<leader>hS", gs.stage_buffer)
  map("n", "<leader>hu", gs.undo_stage_hunk)
  map("n", "<leader>hR", gs.reset_buffer)
  map("n", "<leader>hp", gs.preview_hunk)
  map("n", "<leader>hb", function() gs.blame_line({ full = true }) end)
  map("n", "<leader>hd", gs.diffthis)
end

gitsigns.setup({
  current_line_blame = true,
  max_file_length = 4000,
  on_attach = on_attach,
})
