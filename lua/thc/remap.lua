local vim = vim
local global = vim.g


global.mapleader = " "


vim.keymap.set("n", "<leader>nn", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bk", vim.cmd.bd)
vim.keymap.set("n", "<leader>gg", vim.cmd.G)
vim.keymap.set("n", "<leader>gl", vim.cmd.Gclog)
