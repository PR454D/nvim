local vim = vim


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pakman.lua source % | PackerCompile
  augroup end
]])

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
	function()
		use 'wbthomason/packer.nvim'
		-- My plugins here
		-- use 'foo1/bar1.nvim'
		-- use 'foo2/bar2.nvim'

		use {
			'nvim-telescope/telescope.nvim',
			requires = { { 'nvim-lua/plenary.nvim' } }
		}

		use('elfenpiff/nvim-word-highlight')
		use({
			'nvim-treesitter/nvim-treesitter',
			run = { ':TSUpdate' },
			requires = 'nvim-treesitter/playground',
		})
		use({ 'theprimeagen/harpoon' }) -- blazingly fast jump-back
		use({ 'mbbill/undotree' })
		use({ 'tpope/vim-fugitive' })
		use('norcalli/nvim-colorizer.lua')
		---------------------------------------
		--         LSP
		use {
			'VonHeikemen/lsp-zero.nvim',
			requires = {
				{ 'neovim/nvim-lspconfig' },
				{
					'williamboman/mason.nvim',
					build = function()
						pcall(vim.cmd, 'MasonUpdate')
					end,
				},
				{ 'williamboman/mason-lspconfig.nvim' },

				-- Auto complete
				{ 'hrsh7th/nvim-cmp' },
				{ 'hrsh7th/cmp-buffer' },
				{ 'hrsh7th/cmp-path' },
				{ 'hrsh7th/cmp-nvim-lsp' },
				{ 'hrsh7th/cmp-nvim-lua' },
				{ 'saadparwaiz1/cmp_luasnip' },

				-- snippets
				{ 'L3MON4D3/LuaSnip' },
				{ 'rafamadriz/friendly-snippets' },
			}
		}
		---------------------------------------
		use {
			'folke/tokyonight.nvim',
		}
		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		},
		profile = {
			enable = true,
			threshold = 1
		}
	}
})
