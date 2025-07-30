local vim = vim
require("oil").setup()

vim.keymap.set({ "n", "x" }, "<leader>e", ":Oil<CR>", { silent = true, noremap = true, desc = "File Browser" })
