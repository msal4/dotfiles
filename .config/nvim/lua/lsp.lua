-- Lua config for lspconfig

vim.lsp.config("denols", {
	cmd = { "deno", "lsp" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = {"deno.json", "deno.jsonc"},
	handlers = {
		["textDocument/publishDiagnostics"] = function() end,
	},
})

vim.diagnostic.enable(false, …)
vim.lsp.enable('gopls')
vim.lsp.enable('dartls')

vim.api.nvim_create_autocmd({"BufWritePre"}, {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = {only = {"source.organizeImports"}}
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({async = false})
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.dart",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

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
