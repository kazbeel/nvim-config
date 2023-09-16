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
			"CHANGELOG.md",
		},
		path_display = { "truncate" },
		set_env = { ["COLORTERM"] = "truecolor" },
		mappings = {
			i = {
				["<ESC>"] = actions.close,
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
				["q"] = actions.close,
			},
		},
		layout_config = {
			prompt_position = "top",
			width = 0.90,
			height = 0.90,
			preview_cutoff = 120,
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

set_keymap("n", "<C-p>", "<cmd> Telescope find_files hidden=true <CR>", { desc = "Find files" })
set_keymap(
	"n",
	"<leader>ff",
	"<cmd> Telescope live_grep_args disable_coordinates=true <CR>",
	{ desc = "Find text in files" }
)
set_keymap("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
set_keymap("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })
set_keymap(
	"n",
	"<leader>fs",
	"<cmd> Telescope lsp_document_symbols <CR>",
	{ desc = "List document symbols in current buffer (LSP)" }
)

set_keymap("n", "<leader>fcm", "<cmd> Telescope git_commits <CR>", { desc = "Find Git commits" })
set_keymap("n", "<leader>fr", "<cmd> Telescope registers <CR>", { desc = "Find registers" })
