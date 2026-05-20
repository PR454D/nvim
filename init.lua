require("vim._core.ui2").enable({
  enable = true,
  msg = {
    target = "cmd",
    pager = { height = 0.5 },
    dialog = { height = 0.5 },
    cmd = { height = 0.5 },
    msg = { height = 0.5, timeout = 4500 },
  },
})

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.cmd.packadd("cfilter")
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
require("options")
require("keymaps")

vim.lsp.enable({ "lua_ls" })

