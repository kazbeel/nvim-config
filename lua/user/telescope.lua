local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = "❯ ",
		file_ignore_patterns = {
			".git",
			"node_modules",
			"dist",
			"package-lock.json",
      "CHANGELOG.md"
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
			},
			n = {
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false,
			override_file_sorter = false,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")

set_keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", { desc = "Open specific file" })
set_keymap(
	"n",
	"<leader>ff",
	":Telescope live_grep_args disable_coordinates=true<CR>",
	{ desc = "Find text in files" }
)
set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "List open buffers" })
set_keymap(
	"n",
	"<leader>fs",
	":Telescope lsp_document_symbols<CR>",
	{ desc = "List document symbols in current buffer (LSP)" }
)
