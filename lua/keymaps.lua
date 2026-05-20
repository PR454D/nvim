vim.keymap.set(
  "x",
  "p",
  [["_dP]],
  { desc = "Paste over selection without losing text" }
)
vim.keymap.set(
  "n",
  "<leader>so",
  ":update<CR> :source<CR>",
  { silent = true, noremap = true, desc = "Source current file" }
)
vim.keymap.set(
  "n",
  "<leader>z",
  "<CMD>:.lua<CR>",
  { silent = true, noremap = true, desc = "Execute current line" }
)
vim.keymap.set(
  "n",
  "<leader>rr",
  "<CMD>restart<CR>",
  { silent = true, noremap = true, desc = "Restart neovim" }
)
vim.keymap.set(
  "n",
  "<leader>w",
  ":write<CR>",
  { silent = true, noremap = true, desc = "Write current file" }
)
vim.keymap.set(
  "n",
  "<leader>q",
  ":quit<CR>",
  { silent = true, noremap = true, desc = "Quit" }
)
vim.keymap.set(
  "n",
  "<leader>bd",
  ":bd<CR>",
  { silent = true, noremap = true, desc = "Delete current buffer" }
)
vim.keymap.set(
  "n",
  "<leader>cf",
  vim.lsp.buf.format,
  { desc = "Format by LSP" }
)
vim.keymap.set(
  { "x", "n" },
  "gy",
  vim.lsp.buf.type_definition,
  { desc = "Go to type definition" }
)
vim.keymap.set(
  "n",
  "<leader>lu",
  vim.pack.update,
  { silent = true, noremap = true, desc = "Update All Plugins" }
)

vim.keymap.set(
  "n",
  "<C-h>",
  "<C-w>h",
  { silent = true, noremap = true, desc = "Jump left" }
)
vim.keymap.set(
  "n",
  "<C-l>",
  "<C-w>l",
  { silent = true, noremap = true, desc = "Jump left" }
)
vim.keymap.set(
  "n",
  "<C-j>",
  "<C-w>j",
  { silent = true, noremap = true, desc = "Jump down" }
)
vim.keymap.set(
  "n",
  "<C-k>",
  "<C-w>k",
  { silent = true, noremap = true, desc = "Jump up" }
)
local term_opts = { silent = true }
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- -- Visual --
-- -- Stay in indent mode
vim.keymap.set("v", "<", "<gv", term_opts)
vim.keymap.set("v", ">", ">gv", term_opts)
-- -- Move text up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", term_opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", term_opts)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", term_opts)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", term_opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv==gv", term_opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv==gv", term_opts)
-- -- Visual Block --
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", term_opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", term_opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set(
  "n",
  "Y",
  "y$",
  { silent = true, noremap = true, desc = "Copy to End of line" }
)
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>y",
  '"+y<CR>',
  { silent = true, noremap = true, desc = "Copy to Clipboard" }
)
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>d",
  '"+d<CR>',
  { silent = true, noremap = true, desc = "Copy to Clipboard" }
)
vim.keymap.set(
  "n",
  "<leader>ut",
  function ()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
  end,
  { silent = true, noremap = true, desc = "Toggle Undo Tree" }
)
