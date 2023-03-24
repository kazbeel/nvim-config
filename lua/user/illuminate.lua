local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

illuminate.configure({
	delay = 250,
})

vim.g.Illuminate_ftblacklist = { "NvimTree" }

-- TOOO: Make these key bindings work
-- set_keymap("n", "]]", function()
-- 	require("illuminate").goto_next_reference(true)
-- end, { desc = "Go to next highlighted reference" })
-- set_keymap("n", "[[", function()
-- 	require("illuminate").goto_prev_reference(true)
-- end, { desc = "Go to previous highlighted reference" })

-- Used in lsp/handlers.lua
