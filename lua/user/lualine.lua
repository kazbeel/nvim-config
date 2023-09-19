local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local mode = {
	"mode",
	fmt = function(str)
		return " " .. str
	end,
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

local function lsp_status()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] and client.name ~= "null-ls" then
        return " " .. client.name
      end
    end
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
		lualine_b = { "branch", diff },
		lualine_c = { filetype, filename },
		lualine_x = { diagnostics },
		lualine_y = { lsp_status  },
		lualine_z = { progress, location },
	},
	extensions = { "fugitive" },
})
