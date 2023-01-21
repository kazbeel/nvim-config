local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads Neovim whenever you save the plugins.lua file
local packer_augroup = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = packer_augroup,
  pattern = { "plugins.lua" },
  desc = "Install or remove plugins after saving this file",
  command = "source % | PackerSync",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have Packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Improve Neovim startup times by caching
  use { "lewis6991/impatient.nvim" }

  -- PACKER
  use { "wbthomason/packer.nvim" }

  use { "nvim-lua/plenary.nvim" }

  use { "rcarriga/nvim-notify" }
  use { "stevearc/dressing.nvim" }

  use { "akinsho/toggleterm.nvim" }

  -- Indentation guides
  use { "lukas-reineke/indent-blankline.nvim" }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  -- THEMES
  use { "rebelot/kanagawa.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "dracula/vim", as = "dracula" }

  -- GIT
  use { "tpope/vim-fugitive", tag = "*" }
  use { "akinsho/git-conflict.nvim", tag = "*" }
  use { "lewis6991/gitsigns.nvim" }

  use { "windwp/nvim-autopairs" }
  use { "windwp/nvim-ts-autotag" }

  use { "kylechui/nvim-surround" }

  use { "phaazon/hop.nvim", branch = "v2" }

  use { "numToStr/Comment.nvim" }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" }
  }

  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use { "tiagovla/scope.nvim" }

  use "vim-scripts/ReplaceWithRegister" -- Vim plugin

  -- TREESITTER
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "RRethy/vim-illuminate" } -- Vim plugin

  -- CMP
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "saadparwaiz1/cmp_luasnip" }

  -- TELESCOPE
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-project.nvim" }
  use { "nvim-telescope/telescope-live-grep-args.nvim" }

  -- SNIPPETS
  use { "L3MON4D3/LuaSnip" }
  use { "rafamadriz/friendly-snippets" }

  use { "moll/vim-bbye" }

  use { "christoomey/vim-tmux-navigator" }

  use { "szw/vim-maximizer" }

  use { "b0o/schemastore.nvim" }

  use {"ellisonleao/glow.nvim"}

  use { "p00f/nvim-ts-rainbow" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
