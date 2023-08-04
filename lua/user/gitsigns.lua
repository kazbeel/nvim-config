local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

local on_attach = function(bufnr)
	local gs = package.loaded.gitsigns

	local function map(mode, l, r, desc)
		vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
	end

	map("n", "]h", gs.next_hunk, "Jump to next hunk")
	map("n", "[h", gs.prev_hunk, "Jump to previous hunk")
	map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
	map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
	map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
	map("n", "<leader>hS", gs.stage_buffer, "Stage whole buffer")
	map("n", "<leader>hR", gs.reset_buffer, "Stage whole buffer")
	map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
	map("n", "<leader>hb", function()
		gs.blame_line({ full = true })
	end, "Blame line")
	map("n", "<leader>hd", gs.diffthis, "Show diff")
end

gitsigns.setup({
	current_line_blame = true,
	max_file_length = 4000,
	on_attach = on_attach,
})
