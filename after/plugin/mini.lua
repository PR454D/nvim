local pick = require('mini.pick')
local extra = require('mini.extra')

pick.setup()
extra.setup()
require('mini.icons').setup()
require('mini.statusline').setup()
local mini_pairs = require('mini.pairs')
local mini_notify = require('mini.notify')

mini_pairs.setup()
mini_notify.setup({
    lsp_progress = {
        enable = true,
        level = 'TRACE',
        duration_last = 500,
    }
})
vim.notify = mini_notify.make_notify({
    ERROR = { duration = 2000, hl_group = 'DiagnosticError' },
    WARN  = { duration = 1500, hl_group = 'DiagnosticWarn' },
    INFO  = { duration = 2000, hl_group = 'DiagnosticInfo' },
    DEBUG = { duration = 0, hl_group = 'DiagnosticHint' },
    TRACE = { duration = 0, hl_group = 'DiagnosticOk' },
    OFF   = { duration = 0, hl_group = 'MiniNotifyNormal' },
})

local opts = { silent = true, noremap = true }

vim.keymap.set({ "n", "x" }, "ff", pick.builtin.files, { silent = true, noremap = true, desc = "Find Files" })
vim.keymap.set("n", "<leader>uc", extra.pickers.colorschemes, opts)
vim.keymap.set("n", "<leader>gb", extra.pickers.git_branches, opts)
vim.keymap.set("n", "<leader>gc", extra.pickers.git_commits, opts)
vim.keymap.set("n", "<leader>gh", extra.pickers.git_hunks, opts)
vim.keymap.set({ "n", "x" }, "<leader>fh", pick.builtin.help, { silent = true, noremap = true, desc = "Find help" })
vim.keymap.set({ "n", "x" }, "<leader>sg", pick.builtin.grep_live,
    { silent = true, noremap = true, desc = "Grep Live" })
