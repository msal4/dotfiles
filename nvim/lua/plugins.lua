local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"neovim/nvim-lspconfig",
	"sbdchd/neoformat",
	"ellisonleao/gruvbox.nvim",
	"bluz71/vim-moonfly-colors",
	"nvim-treesitter/nvim-treesitter",
	"github/copilot.vim",
	'hrsh7th/nvim-cmp', -- Auto-completion
	'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
}

-- Setup lazy.nvim
require("lazy").setup({
  spec = plugins,
  checker = { enabled = true },
})
