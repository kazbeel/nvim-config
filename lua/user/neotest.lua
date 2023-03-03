local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

neotest.setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "npx jest --watch ",
    }),
  },
  quickfix = {
    open = false,
  },
})

vim.keymap.set("n", "<leader>tr", function()
  neotest.summary.open()
  neotest.run.run()
end)
vim.keymap.set("n", "<leader>tt", function() neotest.summary.toggle() end)
