-- Bootstrap Packer on first run if it not already installed
local bootstrap = function()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])

		return true
	end

	return false
end

-- Call bootstrap and capture result
local bootstraped = bootstrap()

-- Ensure packer is installed
local ok, packer = pcall(require, "packer")
if not ok then
	vim.notify("failed to require packer")

	return
end

-- Use popup window for Packer
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "rounded",
			})
		end,
	},
})

return packer.startup(function(use)
	-- Plugin Manager
	use({ "wbthomason/packer.nvim" })

	-- Color Scheme
	use({ "navarasu/onedark.nvim" })

	-- -- Indent guides
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- Buffer visualisation
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
	})

	-- Nicer buffer deletion
	use({ "moll/vim-bbye" })

	-- Treesitter (syntax hilighting)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- Project Sidebar
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	})

	-- Commenting
	use({ "numToStr/Comment.nvim" })

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Formatting
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "nvim-lua/plenary.nvim" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Automatically set up configuration after cloning packer.nvim
	if bootstraped then
		require("packer").sync()
	end
end)
