--  Plugins
local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugged")

Plug "tpope/vim-sensible"

Plug "projekt0n/github-nvim-theme"

Plug "williamboman/nvim-lsp-installer"
Plug "neovim/nvim-lspconfig"

Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/nvim-cmp"
Plug "onsails/lspkind.nvim"

Plug "nvim-treesitter/nvim-treesitter"

Plug "windwp/nvim-autopairs"

Plug "xiyaowong/nvim-transparent"

Plug "ryanoasis/vim-devicons"

Plug "windwp/nvim-ts-autotag"

Plug "kyazdani42/nvim-web-devicons"
Plug "preservim/nerdtree"

Plug "hrsh7th/vim-vsnip"

Plug "nvim-lua/plenary.nvim"
Plug "nvim-telescope/telescope.nvim"
Plug "nvim-telescope/telescope-file-browser.nvim"

Plug "nvim-lualine/lualine.nvim"

vim.call("plug#end")

--  Theming
vim.cmd("colorscheme github_dark_default")
require("transparent").setup{
  enable = true,
  extra_groups = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  }
}

--  Hightlight
require("nvim-treesitter.configs").setup{
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true,
    disable = {}
  },
}

--  Lualine
require("lualine").setup{
  options = {
    icon_enabled = true,
    theme = "auto",
  }
}

--  Autopairs
require("nvim-autopairs").setup{}

--  Telescope
local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
telescope.setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "icons", "target", "imgs", "public", "tmp", "cache", "bin" }, 
  }
}

--  LSP  
local lsp_installer = require("nvim-lsp-installer")
local cmp = require("cmp")
local lspkind = require("lspkind")

lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

cmp.setup{
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
  })
}

 -- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
	{ name = 'cmdline' }
  })
})


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.ERROR
    }
  },
  underline = {
    severity = {
      min = vim.diagnostic.severity.ERROR
    }
  },
  signs = {
    severity = {
      min = vim.diagnostic.severity.ERROR
    }
  },
  severity_sort = true,
})

require("lspconfig").solargraph.setup{
  flags = {
  --  debounce_text_changes = 150
  },
  capabilities = capabilities
}

require("lspconfig").tsserver.setup{
  flags = {
  --  debounce_text_changes = 150
  },
  capabilities = capabilities
}

require("lspconfig").gopls.setup{
  capabilities = capabilities
}

require("lspconfig").volar.setup{
  capabilities = capabilities
}

--  Settings
vim.cmd("set nocompatible")
vim.cmd("set nu rnu")
vim.cmd("set shortmess+=c")
vim.cmd("set smartindent")
vim.cmd("set nowrap")
vim.cmd("set expandtab")
vim.cmd("set title")
vim.cmd("set hlsearch")
vim.cmd("set showcmd")
vim.cmd("set ignorecase")
vim.cmd("set cursorline")
vim.cmd("set lazyredraw")
vim.cmd("filetype plugin indent on")
vim.cmd("set ai")

vim.cmd("set completeopt=menuone,noinsert,noselect")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cmdheight=1")
vim.cmd("set updatetime=50")
vim.cmd("set signcolumn=yes")
vim.cmd("set laststatus=2")
vim.cmd("set scrolloff=10")
vim.cmd("set mouse=a")

--  Keybindings
vim.cmd("nnoremap <C-t> :NERDTreeToggle<CR>")
vim.cmd("nnoremap <C-f> :NERDTreeFocus<CR>")
vim.cmd("noremap <C-z> :undo<CR>")
vim.cmd("noremap <C-r> :redo<CR>")
vim.cmd("inoremap <C-z> <Esc>:undo<CR>")
vim.cmd("inoremap <C-r> :redo<CR>")
vim.cmd("vnoremap <C-z> :undo<CR>")
vim.cmd("vnoremap <C-r> :redo<CR>")
vim.cmd("nmap <C-a> gg<S-v>G")
vim.cmd("nmap <S-Up> v<Up>")
vim.cmd("nmap <S-Down> v<Down>")
vim.cmd("nmap <S-Left> v<Left>")
vim.cmd("nmap <S-Right> v<Right>")
vim.cmd("vmap <S-Up> <Up>")
vim.cmd("vmap <S-Down> <Down>")
vim.cmd("vmap <S-Left> <Left>")
vim.cmd("vmap <S-Right> <Right>")
vim.cmd("imap <S-Up> <Esc>v<Up>")
vim.cmd("imap <S-Down> <Esc>v<Down>")
vim.cmd("imap <S-Left> <Esc>v<Left>")
vim.cmd("imap <S-Right> <Esc>v<Right>")
vim.cmd("nnoremap <leader>d '_d")
vim.cmd("nnoremap x '_x")
vim.cmd("nmap <S-Tab> :tabprev<Return>")
vim.cmd("nmap <Tab> :tabnext<Return>")
vim.cmd("vmap <C-c> y<Esc>i")
vim.cmd("vmap <C-x> d<Esc>i")
vim.cmd("map <C-v> pi")
vim.cmd("imap <C-v> <Esc>pi")
vim.cmd("nmap <C-A-Down> <PageDown>")
vim.cmd("nmap <C-A-Up> <PageUp>")
vim.cmd("vmap <C-A-Down> <PageDown>")
vim.cmd("vmap <C-A-Up> <PageUp>")
vim.cmd("imap <C-A-Down> <PageDown>")
vim.cmd("imap <C-A-Up> <PageUp>")
vim.cmd("nmap <C-Space> :Telescope find_files<CR>")
vim.cmd("vmap <C-Space> :Telescope find_files<CR>")
