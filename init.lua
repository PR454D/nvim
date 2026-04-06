local opt = vim.o
local win_opts = vim.wo
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/site/pack/core/opt")

opt.relativenumber = true
opt.number = true
opt.wrap = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.swapfile = false
opt.confirm = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.autoindent = true

opt.updatetime = 50
opt.exrc = true
opt.showtabline = 2
opt.cursorline = true
opt.colorcolumn = "80,120"
opt.signcolumn = "yes:2"
win_opts.list = true
opt.winborder = "rounded"
opt.lcs = "extends:⇉,precedes:≺,tab:➜ ,trail:·,nbsp:%,eol:⤶,space:·"

opt.scrolloff = 15
opt.pumheight = 10
opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"

vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
vim.opt.termguicolors = true
vim.opt.linebreak = true
vim.opt.smoothscroll = true
vim.opt.wildmenu = true
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.wildoptions:append { 'pum' }
vim.opt.path:append { '**' }
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99

vim.cmd [[ hi NvimWordHighLight guifg='#f0faf5ff' guibg=none gui=bold ]]

-- highlighting on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})


vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set(
    "n",
    "<leader>so",
    ":update<CR> :source<CR>",
    { silent = true, noremap = true, desc = "Source current file" }
)
vim.keymap.set("n", "<leader>z", "<CMD>:.lua<CR>", { silent = true, noremap = true, desc = "Execute current line" })
vim.keymap.set("n", "<leader>rr", "<CMD>restart<CR>", { silent = true, noremap = true, desc = "Restart neovim" })
vim.keymap.set("n", "<leader>w", ":write<CR>", { silent = true, noremap = true, desc = "Write current file" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { silent = true, noremap = true, desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":close<CR>", { silent = true, noremap = true, desc = "Close window" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { silent = true, noremap = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format by LSP" })
vim.keymap.set("n", "<leader>lu", vim.pack.update, { silent = true, noremap = true, desc = "Update All Plugins" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, noremap = true, desc = "Jump left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, noremap = true, desc = "Jump left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, noremap = true, desc = "Jump down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, noremap = true, desc = "Jump up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Y", "y$", { silent = true, noremap = true, desc = "Copy to End of line" })
vim.keymap.set({ 'n', 'v', 'x' }, "<leader>y", '"+y<CR>', { silent = true, noremap = true, desc = "Copy to Clipboard" })
vim.keymap.set({ 'n', 'v', 'x' }, "<leader>d", '"+d<CR>', { silent = true, noremap = true, desc = "Copy to Clipboard" })

vim.pack.add {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',

    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

    { -- blink completion
        src = "https://github.com/Saghen/blink.cmp",
        version = vim.version.range("*")
    },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/MagicDuck/grug-far.nvim" },
    "https://github.com/lewis6991/gitsigns.nvim",

    'https://github.com/stevearc/oil.nvim',
    'https://github.com/folke/tokyonight.nvim',

    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/tpope/vim-fugitive',

    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
if capabilities.workspace then
    capabilities.workspace.didChangeWatchedFiles = nil
end
vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.o.complete = 'o,.,w,b,u'
            vim.o.completeopt = 'menu,menuone,popup,noinsert'
            vim.lsp.completion.enable(true, client.id, args.buf)
        end
    end,
})

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

vim.lsp.enable({ 'lua_ls' })
