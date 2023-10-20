local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local mode = {
	"mode",
	icon = "",
}

local branch = {
	"branch",
	icon = "",
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
}

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

local progress = {
	"progress",
	separator = "",
	padding = { left = 1, right = 0 },
}

local location = {
	"location",
	padding = { left = 0, right = 1 },
}

local function lsp_status()
	if rawget(vim, "lsp") then
		local lsp_servers = ""

		for _, client in ipairs(vim.lsp.get_active_clients()) do
			print(client.name)
			if client.attached_buffers[vim.api.nvim_get_current_buf()] and client.name ~= "null-ls" then
				lsp_servers = lsp_servers .. " " .. client.name
			end
		end

		return lsp_servers
	end

	return ""
end

lualine.setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
		theme = "auto",
		disabled_filetypes = { "packer", "NvimTree" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { filetype, filename },
		lualine_x = { diagnostics },
		lualine_y = { lsp_status },
		lualine_z = { progress, location },
	},
	extensions = { "fugitive" },
})
