vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pakman.lua source % | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function()
	use 'wbthomason/packer.nvim'
	-- My plugins here
	-- use 'foo1/bar1.nvim'
	-- use 'foo2/bar2.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} } 
	}

	use ({
		'nvim-treesitter/nvim-treesitter', run = { ':TSUpdate' },
		requires = 'nvim-treesitter/playground',
	})
	use ({ 'theprimeagen/harpoon' }) -- blazingly fast jump-back
	use ({ 'mbbill/undotree' })
	use ({ 'tpope/vim-fugitive' })
	use {
		'folke/tokyonight.nvim',
		config = function ()
			vim.cmd[[colorscheme tokyonight-moon]]
		end
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
}})
