local vim = vim

local opt = vim.o
-- local buf_opts = vim.bo
local win_opts = vim.wo

opt.relativenumber = true
opt.number = true
opt.wrap = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.swapfile = false

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
-- opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"

vim.cmd [[
hi NvimWordHighLight guifg='#f0faf5ff' guibg=none gui=bold
]]

-- highlighting on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

vim.cmd [[
set path+=**
set wildmenu
set wildoptions=pum
]]

vim.g.mapleader = " "
vim.keymap.set(
    "n",
    "<leader>so",
    ":update<CR> :source<CR>",
    { silent = true, noremap = true, desc = "Source current file" }
)
vim.keymap.set("n", "<leader>w", ":write<CR>", { silent = true, noremap = true, desc = "Write current file" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { silent = true, noremap = true, desc = "Quit" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { silent = true, noremap = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format by LSP" })

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
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/tpope/vim-fugitive" },
}

vim.lsp.enable { "lua_ls", "jdtls" }
