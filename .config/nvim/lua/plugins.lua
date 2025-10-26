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
	'tpope/vim-fugitive',
	{
		'junegunn/fzf.vim',
		dependencies = { 'junegunn/fzf' },
		config = function()
			-- Make it appear at the bottom
			vim.g.fzf_layout = { down = '~40%' }

			-- Keymaps
			vim.keymap.set('n', '<leader>ff', ':Files<CR>', { desc = 'Find files' })
			vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { desc = 'Live grep' })
			vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { desc = 'Find buffers' })
			vim.keymap.set('n', '<leader>fh', ':Helptags<CR>', { desc = 'Help tags' })
		end,
	}

}

-- Setup lazy.nvim
require("lazy").setup({
	spec = plugins,
	checker = { enabled = true },
})
