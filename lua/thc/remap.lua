local vim = vim
local global = vim.g

global.mapleader = " "

vim.keymap.set("n", "<leader>nn", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bk", vim.cmd.bd)
