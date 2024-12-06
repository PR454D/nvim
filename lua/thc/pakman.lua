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

return require("lazy").setup({
  spec = {
    { import = "plugins.lsp" },
    { import = "plugins.ui" },
    { import = "plugins.mini" },
    { import = "plugins" },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight-moon" } },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  ui = { border = "rounded", size = { width = 0.6, height = 0.8 } },
})

-- function()
-- 	use 'wbthomason/packer.nvim'
-- 	-- My plugins here
-- 	-- use 'foo1/bar1.nvim'
-- 	-- use 'foo2/bar2.nvim'
--
-- 	use 'mfussenegger/nvim-jdtls'
-- 	use {
-- 		'nvim-telescope/telescope.nvim',
-- 		requires = { { 'nvim-lua/plenary.nvim' } }
-- 	}
--
-- 	use('elfenpiff/nvim-word-highlight')
-- 	use({
-- 		'nvim-treesitter/nvim-treesitter',
-- 		run = { ':TSUpdate' },
-- 		requires = 'nvim-treesitter/playground',
-- 	})
-- 	use({ 'theprimeagen/harpoon' }) -- blazingly fast jump-back
-- 	use({ 'mbbill/undotree' })
-- 	use({ 'tpope/vim-fugitive' })
-- 	use('norcalli/nvim-colorizer.lua')
-- 	---------------------------------------
-- 	--         LSP
-- 	use {
-- 		'VonHeikemen/lsp-zero.nvim',
-- 		requires = {
-- 			{ 'neovim/nvim-lspconfig' },
-- 			{
-- 				'williamboman/mason.nvim',
-- 				build = function()
-- 					pcall(vim.cmd, 'MasonUpdate')
-- 				end,
-- 			},
-- 			{ 'williamboman/mason-lspconfig.nvim' },
--
-- 			-- Auto complete
-- 			{ 'hrsh7th/nvim-cmp' },
-- 			{ 'hrsh7th/cmp-buffer' },
-- 			{ 'hrsh7th/cmp-path' },
-- 			{ 'hrsh7th/cmp-nvim-lsp' },
-- 			{ 'hrsh7th/cmp-nvim-lua' },
-- 			{ 'saadparwaiz1/cmp_luasnip' },
--
-- 			-- snippets
-- 			{ 'L3MON4D3/LuaSnip' },
-- 			{ 'rafamadriz/friendly-snippets' },
-- 		}
-- 	}
-- 	---------------------------------------
-- 	use {
-- 		'folke/tokyonight.nvim',
-- 	}
-- 	if packer_bootstrap then
-- 		require('packer').sync()
-- 	end
-- end,
-- config = {
-- 	display = {
-- 		open_fn = function()
-- 			return require('packer.util').float({ border = 'single' })
-- 		end
-- 	},
-- 	profile = {
-- 		enable = true,
-- 		threshold = 1
-- 	}
-- }
