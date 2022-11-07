local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local current_color_scheme = vim.g.colors_name
local theme = "auto"

if current_color_scheme == "tokyonight" then
  theme = "tokyonight"
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = ' ', hint = ' ' },
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

lualine.setup({
  options = {
    globalstatus = true,
    theme = theme,
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { diagnostics },
    lualine_x = { "diff", "encoding", filetype },
    lualine_y = { },
    lualine_z = { "location" },
  },
})

