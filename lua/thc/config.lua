local vim = vim
local o = vim.o
local opt = vim.opt
local wo = vim.wo

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftwidth = 2
o.inccommand = "nosplit"

o.number = true
o.relativenumber = true

opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.autoindent = true

opt.wrap = false
opt.swapfile = false
opt.backup = false

opt.splitright = true
opt.splitbelow = true

-- indent guides
wo.list = true
o.lcs = "extends:⇉,precedes:≺,tab:➜ ,trail:·,nbsp:%,eol:⤶,space:·"

wo.wrap = false

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
--Set highlight on search
o.hlsearch = false
o.incsearch = true

--Make line numbers default
wo.number = true
wo.relativenumber = true

opt.termguicolors = true

o.ignorecase = true
o.smartcase = true

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

opt.scrolloff = 15
opt.pumheight = 10
opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

opt.updatetime = 50
vim.opt.colorcolumn = "80,120"

o.exrc = true
o.showtabline = 2
o.cursorline = true
o.colorcolumn = "80,120"
o.signcolumn = "yes:2"

vim.cmd([[
  hi NvimWordHighLight guifg='#f0faf5ff' guibg=none gui=bold
]])

-- highlighting on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- ###
-- type: doc; title: Hello;
-- native vim options
---
---_

vim.cmd([[

    set path+=**
    set wildmenu
    set wildoptions=pum
    set wildignore+=**/node_modules/**
    set shortmess+=c
    set whichwrap+=<,>,[,],h,l
    set iskeyword+=-
    set formatoptions-=cro
    set background=dark
    set foldmethod=expr
    " set foldmarker=###,###
    set foldexpr=nvim_treesitter#foldexpr()
    let g:neovide_refresh_rate=140
    let g:livepreview_previewer = 'zathura'
    let g:livepreview_engine = "lualatex"
    if has("gui_running")
        set guifont=\"JetBrainsMonoMedium Nerd Font Mono:h12\"
    endif
    augroup BuildNote
        autocmd!
        autocmd BufWritePost,FileWritePost *note-*.md silent !buildnote %:p
    augroup end
]])

-- #endregion ###
