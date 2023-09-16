local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local filetype = {
	"filetype",
	icon_only = true,
	separator = "",
	padding = { left = 1, right = 0 },
}

local filename = {
	"filename",
	path = 1,
}

local diagnostics = {
	"diagnostics",
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
}

local progress = {
	"progress",
	separator = "",
	padding = { left = 1, right = 0 },
}

local location = {
	"location",
	padding = { left = 0, right = 1 },
}

lualine.setup({
	options = {
		globalstatus = true,
		theme = "auto",
		disabled_filetypes = { "packer", "NvimTree" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { filetype, filename, diagnostics },
		lualine_x = { diff },
		lualine_y = { "encoding" },
		lualine_z = { progress, location },
	},
	extensions = { "fugitive" },
})
