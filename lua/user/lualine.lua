local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local filename = {
  "filename",
  path = 1,
}

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
    theme = "auto",
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { filename, diagnostics },
    lualine_x = { "diff", "encoding" },
    lualine_y = { filetype },
    lualine_z = { "location" },
  },
})

