local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npx jest --watch ",
		}),
	},
	quickfix = {
		open = false,
	},
})

set_keymap("n", "<leader>tc", function()
	neotest.run.run()
end, { desc = "Run test case" })
set_keymap("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run test file" })
set_keymap("n", "<leader>tt", function()
	neotest.summary.toggle()
end, { desc = "Toggle tests summary" })
