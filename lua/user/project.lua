local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

project.setup({
  detection_methods = { "pattern" },
  patterns = { ".git", ".svn", "Makefile", "package.json" },
})

-- For NvimTree to work propertly some configuration has had to be done
-- It may be a good idea to configure those parameters in here

-- Add integration with Telescope
local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension("projects")

vim.keymap.set("n", "<leader>pr", ":Telescope projects<CR>", { silent = true })
