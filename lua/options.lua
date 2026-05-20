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
opt.backup = false
opt.undodir = vim.fn.stdpath('data') .. "/undodir"
opt.undofile = true
opt.confirm = true

opt.hlsearch = false
opt.incsearch = true
opt.inccommand = 'split'
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 3

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
opt.cmdheight = 0
opt.pumheight = 10
vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
opt.guicursor = ""
opt.signcolumn = "yes"

vim.opt.completeopt = "menu,menuone,fuzzy,noinsert"
vim.opt.termguicolors = true
vim.opt.linebreak = true
vim.opt.smoothscroll = true
vim.opt.wildmenu = true
vim.opt.wildoptions:append({ "fuzzy" })
vim.opt.wildoptions:append({ "pum" })
vim.opt.path:append({ "**" })
vim.opt.grepprg = "rg --vimgrep --no-messages --smart-case"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 10

vim.cmd([[ hi NvimWordHighLight guifg='#f0faf5ff' guibg=none gui=bold ]])

-- highlighting on yank
local highlight_group =
  vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

