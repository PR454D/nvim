local oil = require("oil")
oil.setup()

vim.keymap.set(
  { "n", "x" },
  "-",
  vim.cmd.Oil,
  { silent = true, noremap = true, desc = "File Explorer" }
)
vim.keymap.set(
  { "n", "x" },
  "<leader><leader>",
  vim.cmd.Oil,
  { silent = true, noremap = true, desc = "File Explorer" }
)
