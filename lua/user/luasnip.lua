local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- Load existing vs-code style snippets from the plugin 'friendly-snippets'
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "~/.config/nvim/lua/user/snippets" }
})

luasnip.filetype_extend("all", { "_" })
