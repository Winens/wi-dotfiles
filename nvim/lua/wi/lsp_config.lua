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
