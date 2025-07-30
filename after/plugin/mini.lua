local vim = vim
local pick = require("mini.pick")
local extra = require("mini.extra")
local notify = require("mini.notify")
pick.setup()
extra.setup()
notify.setup()
vim.notify = notify.make_notify({
    ERROR = { duration = 2000 },
    WARN = { duration = 500 },
    INFO = { duration = 200 },
})
require('mini.pairs').setup()
require('mini.icons').setup()
require('mini.starter').setup()
require('mini.statusline').setup()
-- require('mini.completion').setup()

local opts = { silent = true, noremap = true }
vim.keymap.set({ "n", "x" }, "<leader>ff", pick.builtin.files, opts)
vim.keymap.set("n", "<leader>uc", extra.pickers.colorschemes, opts)
vim.keymap.set("n", "<leader>gb", extra.pickers.git_branches, opts)
vim.keymap.set("n", "<leader>gc", extra.pickers.git_commits, opts)
vim.keymap.set("n", "<leader>gh", extra.pickers.git_hunks, opts)
-- desc = "Find files" })
vim.keymap.set({ "n", "x" }, "<leader>fh", pick.builtin.help, { silent = true, noremap = true, desc = "Find files" })
vim.keymap.set({ "n", "x" }, "<leader>sg", pick.builtin.grep_live,
    { silent = true, noremap = true, desc = "Grep Live" })
