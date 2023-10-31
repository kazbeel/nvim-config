local colorscheme = "kanagawa"

require("user.color-schemes." .. colorscheme)

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
