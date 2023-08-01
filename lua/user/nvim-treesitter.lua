local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"dockerfile",
		"gitattributes",
		"gitignore",
		"graphql",
		"vimdoc",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"query",
		"regex",
		"scss",
		"sql",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
		"prisma",
	},
	ignore_install = { "phpdoc" },
	highlight = {
		enable = true,
		disable = { "" },
	},
	indent = {
		enable = true,
	},
	-- nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			lookahead = false,
			include_surrounding_whitespace = false,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]]"] = "@function.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
			},
		},
		lsp_interop = {
			enable = true,
			border = "none",
			floating_preview_opts = {},
			peek_definition_code = {
				["gD"] = "@function.outer",
			},
		},
	},
	-- nvim-tx-context-commentstring settings
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- nvim-ts-rainbow settings
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = 5000,
	},
})
