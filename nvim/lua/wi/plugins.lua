local packer = require("packer")

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use "tpope/vim-sensible"
  use "projekt0n/github-nvim-theme"
  use "navarasu/onedark.nvim"
  use "tiagovla/tokyodark.nvim"

  --use "williamboman/nvim-lsp-installer"
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  }

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "onsails/lspkind.nvim"
  use "L3MON4D3/LuaSnip"

  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
  }

  use "windwp/nvim-autopairs"

  use "ryanoasis/vim-devicons"

  use "windwp/nvim-ts-autotag"

  use "kyazdani42/nvim-web-devicons"
  use "preservim/nerdtree"

  use "hrsh7th/vim-vsnip"

  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use "nvim-lualine/lualine.nvim"
  
  use "romgrk/barbar.nvim"
  
  use "jose-elias-alvarez/null-ls.nvim"
  use "sbdchd/neoformat" 
  
  use "MunifTanjim/prettier.nvim"
  use {
    "glepnir/lspsaga.nvim",
    branch = "main"
  }

  use "RRethy/nvim-treesitter-endwise"

  use "sheerun/vim-polyglot"

  use "norcalli/nvim-colorizer.lua"
  
  use "folke/zen-mode.nvim"

  use "andweeb/presence.nvim"
end
)
