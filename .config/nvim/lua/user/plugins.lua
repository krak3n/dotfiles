local fun = vim.fn
local cmd = vim.cmd

-- Automatically install packer
local install_path = fun.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fun.empty(fun.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fun.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("failed to require packer")

  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {
        border = "rounded"
      }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  -- Core plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colour Scheme
  use "navarasu/onedark.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lua" -- Command line completion
  use "hrsh7th/cmp-buffer" -- Buffer Completions
  use "hrsh7th/cmp-path" -- Path Completions
  use "hrsh7th/cmp-cmdline" -- Command line completion
  use "saadparwaiz1/cmp_luasnip" -- Snippet Completions

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets" -- Useful snippets

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for cmp-nvim
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim" -- Image previws in Telescope

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- UX
  use "p00f/nvim-ts-rainbow" -- Rainbow parentheses
  use "lukas-reineke/indent-blankline.nvim" -- Indentation Highlight
  use "windwp/nvim-autopairs" -- Autopairs
  use "lewis6991/gitsigns.nvim" -- Gitsigns

  -- Comments
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Project draw (nvim-tree)
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"

  -- Bufferline (tabs)
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
