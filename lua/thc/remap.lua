local vim = vim
local global = vim.g

global.mapleader = " "

-- vim.keymap.set("n", "<leader>nn", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bk", vim.cmd.bd)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "Y", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>s", ":so<CR>")

vim.keymap.set("x", "<leader>p", '"_dP')

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- delete to void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quickfix navigation
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Prev quickfix item" })

-- next greatest remap ever : asbjornHaland (yanking and pasting)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>p", [[o<esc>"+p]], { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>d", [["_d]], { desc = "Paste from system clipboard" })

-- replace current word
vim.keymap.set(
  "n",
  "<leader>rp",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace current word" }
)

-- window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>wn", "<C-w>w", { desc = "Move to next window" })
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- window movement
vim.keymap.set("n", "<c-h>", "<C-w>h", { desc = "Jump left" })
vim.keymap.set("n", "<c-j>", "<C-w>j", { desc = "Jump down" })
vim.keymap.set("n", "<c-k>", "<C-w>k", { desc = "Jump up" })
vim.keymap.set("n", "<c-l>", "<C-w>l", { desc = "Jump right" })

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffer navigation
vim.keymap.set("n", "<leader>ur", "<C-o>", { desc = "Previous Buffer" })
