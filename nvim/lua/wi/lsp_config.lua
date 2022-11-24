local mason = require("mason")
local mason_cfg = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require("lspkind")

mason.setup({})
mason_cfg.setup({
	automatic_installation = true,
})

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local border_opts =
	{ border = "single", winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None" }

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({ with_text = true, maxwidth = 55 }),
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			luasnip.filetype_extend("ruby", { "rails" })
		end,
	},
	window = {
		completion = cmp.config.window.bordered(border_opts),
		documentation = cmp.config.window.bordered(border_opts),
	},
	duplicates = {
		nvim_lsp = 1,
		luasnip = 1,
		cmp_tabnine = 1,
		buffer = 1,
		path = 1,
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Esc>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
	underline = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
	signs = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
	severity_sort = true,
})

lspconfig["gopls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["cmake"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["clangd"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["tailwindcss"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["sumneko_lua"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["solargraph"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
