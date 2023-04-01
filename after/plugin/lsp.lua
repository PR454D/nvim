local lsp = require('lsp-zero')

lsp.ensure_installed({ 'tsserver', 'eslint', })

local cmp = require('cmp')
-- local cmp_select = { behaviour = cmp.SelectBehaviour.Select } 
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm(cmp_select),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.preset({
	manage_nvim_cmp = {
		set_sources = 'recommended',
		set_basic_mappings = true,
		set_extra_mappings = true,
		use_luasnip = true,
		set_format = true,
		documentation_window = true,
	}
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
