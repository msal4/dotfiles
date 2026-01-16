vim.opt.guicursor = ""
vim.opt.autoindent = true
vim.opt.number = false
vim.opt.encoding = "utf-8"
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrollbind = false

-- wrap text
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.cmd("set wrap")
vim.cmd("set linebreak")

vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.laststatus = 2
vim.opt.sidescroll = 5
vim.opt.listchars:append("precedes:<,extends:>")
vim.opt.signcolumn = "number"
vim.opt.termbidi = true
vim.opt.encoding = "utf8"
-- vim.opt.background = "dark"
-- for some reason these cannot be set via the object
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")
