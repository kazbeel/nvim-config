local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	filters = {
		dotfiles = false,
		custom = { "^.git$" },
	},
	git = {
		enable = true,
		ignore = false,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	view = {
		width = 40,
	},
	renderer = {
		full_name = true,
		root_folder_label = false,
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	sync_root_with_cwd = true,

	respect_buf_cwd = true,
	update_focused_file = {
		enable = false,
		update_root = true,
	},
})

set_keymap("n", "<C-t>", ":NvimTreeToggle<CR>", { desc = "Toggle files explorer" })

local function open_nvim_tree(data)
	-- Buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- Buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- Change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- Open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
