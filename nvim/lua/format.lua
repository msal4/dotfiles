vim.g.neoformat_try_node_exe = 1

vim.cmd[[
  autocmd BufWritePre *.js,*.ts,*.svelte,*.css,*.json,*.html,*.tsx Neoformat
]]
