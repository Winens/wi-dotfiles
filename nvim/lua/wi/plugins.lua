local packer = require("packer")

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use "tpope/vim-sensible"
  use "projekt0n/github-nvim-theme"
  
  use "williamboman/nvim-lsp-installer"
  use "neovim/nvim-lspconfig"

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "onsails/lspkind.nvim"

  use "nvim-treesitter/nvim-treesitter"

  use "windwp/nvim-autopairs"

  use "xiyaowong/nvim-transparent"

  use "ryanoasis/vim-devicons"

  use "windwp/nvim-ts-autotag"

  use "kyazdani42/nvim-web-devicons"
  use "preservim/nerdtree"

  use "hrsh7th/vim-vsnip"

  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use "nvim-lualine/lualine.nvim"
end
)
