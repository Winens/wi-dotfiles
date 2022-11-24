local packer = require("packer")

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"chipsenkbeil/distant.nvim",
		config = function()
			require("distant").setup({
				-- Applies Chip's personal settings to every machine you connect to
				--
				-- 1. Ensures that distant servers terminate with no connections
				-- 2. Provides navigation bindings for remote directories
				-- 3. Provides keybinding to jump into a remote file's parent directory
				["*"] = require("distant.settings").chip_default(),
			})
		end,
	})

	use("lewis6991/impatient.nvim")
	use({
		"lewis6991/satellite.nvim",
		config = function()
			require("satellite").setup()
		end,
	})

	use("tpope/vim-sensible")

	use("projekt0n/github-nvim-theme")
	use("navarasu/onedark.nvim")
	use("Luxed/ayu-vim")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	})

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind.nvim")
	use("L3MON4D3/LuaSnip")

	use({
		"nvim-treesitter/nvim-treesitter",
		--commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use("windwp/nvim-autopairs")

	use("ryanoasis/vim-devicons")

	use("windwp/nvim-ts-autotag")

	use("kyazdani42/nvim-web-devicons")
	use("preservim/nerdtree")

	use("hrsh7th/vim-vsnip")

	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	use("nvim-lualine/lualine.nvim")

	use("romgrk/barbar.nvim")

	use("jose-elias-alvarez/null-ls.nvim")
	use("sbdchd/neoformat")

	use("MunifTanjim/prettier.nvim")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	use("RRethy/nvim-treesitter-endwise")

	use("sheerun/vim-polyglot")

	use("norcalli/nvim-colorizer.lua")

	use("folke/zen-mode.nvim")

	--use("andweeb/presence.nvim")

	use("goolord/alpha-nvim")

	use("numToStr/Comment.nvim")

	use("akinsho/toggleterm.nvim")

	use("dinhhuy258/git.nvim")
	use("lewis6991/gitsigns.nvim")

	use("rafamadriz/friendly-snippets")

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
end)
