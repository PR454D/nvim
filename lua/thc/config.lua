local vim = vim

vim.bo.tabstop=4
vim.bo.softtabstop=4
vim.bo.shiftwidth=4
vim.bo.expandtab=true

vim.o.number = true
vim.o.relativenumber = true

vim.opt.smartindent=true
vim.opt.wrap=false
vim.opt.swapfile=false
vim.opt.backup=false

vim.opt.undodir=os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile=true
vim.opt.hlsearch=false
vim.opt.incsearch=true

vim.opt.termguicolors=true

vim.opt.scrolloff=8
vim.opt.pumheight=10
vim.opt.signcolumn="yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn="80"
vim.cmd[[
hi NvimWordHighLight guifg='#f0faf512' guibg=none gui=bold
]]
