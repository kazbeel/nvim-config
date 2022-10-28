local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' },
    javascript = { 'template_string' },
    java = false,
  },
  disable_filetype = { "TelescopePrompt" },
})

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ }))

