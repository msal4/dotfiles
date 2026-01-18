-- Lua config for lspconfig

vim.diagnostic.enable(false, …)

-- Configure ts_ls with proper root detection for Node/npm projects
-- vim.lsp.config('ts_ls', {
-- 	root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
-- })

vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('dartls')
vim.lsp.enable('zls')

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' }, -- LSP source
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
	['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<TAB>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		-- open in new tab
		vim.keymap.set('n', 'gD', function()
			vim.cmd('tab split')
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<ctrl>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<ctrl>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<ctrl>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
