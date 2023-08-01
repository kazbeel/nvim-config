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

set_keymap("n", "<leader>tr", function()
	neotest.summary.open()
	neotest.run.run()
end, { desc = "Run tests" })
set_keymap("n", "<leader>tt", function()
	neotest.summary.toggle()
end, { desc = "Toggle test results summary" })
