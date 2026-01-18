vim.cmd[[
  autocmd BufNewFile,BufRead *.arb set filetype=json
  autocmd FileType dart setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
]]

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dart',
  command = 'setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2',
})
