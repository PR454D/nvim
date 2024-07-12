return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
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
		{ 'nvim-java/nvim-java' },
	}
}
