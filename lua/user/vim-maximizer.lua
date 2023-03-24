vim.g.maximizer_set_default_mapping = 0

set_keymap({ "n", "i" }, "<C-w>z", ":MaximizerToggle<CR>", { desc = "Maximize window (toggle)" })
