local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = {
    "bash", "c", "cmake", "comment", "cpp",
    "dockerfile", "gitattributes", "gitignore", "graphql", "help",
    "html", "http", "javascript", "jsdoc", "json",
    "json5", "lua", "make", "markdown",
    "markdown_inline", "query", "regex", "scss", "sql", "toml",
    "tsx", "typescript", "vim", "yaml",
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
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer"
      },
      goto_previous_start = {
        ["[m"] = "@function.outer"
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
