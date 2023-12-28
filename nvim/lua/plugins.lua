vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use "neovim/nvim-lspconfig"
	use "sbdchd/neoformat"
	use "ellisonleao/gruvbox.nvim"
	use "bluz71/vim-moonfly-colors"
	use "nvim-treesitter/nvim-treesitter"
end)
