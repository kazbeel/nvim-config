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
    },
    mappings = {
      i = {
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
    project = {
      display_type = "full",
      sync_with_nvim_tree = true,
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<C-p>", ":Telescope find_files hidden=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", ":Telescope live_grep_args disable_coordinates=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fp", ":Telescope project<CR>", { silent = true })
