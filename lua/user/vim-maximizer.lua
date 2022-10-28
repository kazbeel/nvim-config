vim.g.maximizer_set_default_mapping = 0

vim.keymap.set({ "n", "i" }, "<C-w>z", ":MaximizerToggle<CR>", { silent = true })
