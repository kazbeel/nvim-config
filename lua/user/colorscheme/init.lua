local color_scheme = require("core.user").colorscheme

-- Load color scheme
local color_scheme_ok, _ = require("user.colorscheme." .. color_scheme)
if not color_scheme_ok then
  vim.notify("Error loading the color scheme " .. color_scheme)
end

-- Assign color scheme to Neovim
local colorscheme_ok, _ = pcall(vim.cmd, "colorscheme " .. color_scheme)
if not colorscheme_ok then
  vim.notify("Color scheme " .. color_scheme .. " not found!")
end
