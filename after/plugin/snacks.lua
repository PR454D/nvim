local snacks = require("snacks")

snacks.setup({
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  gitbrowse = { enabled = true },
  dim = { enabled = true },
  image = { enabled = true },
  terminal = { enabled = true },
  scroll = { enabled = true },
  rename = { enabled = true },
  picker = {
    enabled = true,
    matcher = {
      frecency = true,
      history_bonus = true,
    },
    ui_select = true,
    layout = {
      preset = "ivy",
      layout = {
        backdrop = 70,
      },
    },
    layouts = {
      -- If any plugin tries to use the default, overwrite with the ivy preset
      default = {
        layout = {
          box = "vertical",
          backdrop = 70,
          row = -1,
          width = 0,
          height = 0.4,
          border = "rounded",
          title = " {title} {live} {flags}",
          title_pos = "left",
          { win = "input", height = 1, border = "rounded" },
          {
            box = "horizontal",
            { win = "list", border = "rounded" },
            {
              win = "preview",
              title = "{preview}",
              width = 0.6,
              border = "rounded",
            },
          },
        },
      },
    },
  },
  icons = {
    git = {
      enabled = true,
    },
  },
})

vim.keymap.set(
  { "x", "n" },
  "<leader>ff",
  snacks.picker.files,
  { noremap = true, desc = "Find Files" }
)

vim.keymap.set(
  { "x", "n" },
  "<leader>gd",
  snacks.picker.git_diff,
  { noremap = true, desc = "Git Diff" }
)

vim.keymap.set(
  { "x", "n" },
  "<leader>gl",
  snacks.picker.git_log,
  { noremap = true, desc = "Git Log" }
)

vim.keymap.set(
  { "x", "n" },
  "<leader>uc",
  snacks.picker.colorschemes,
  { noremap = true, desc = "ColorScheme" }
)

vim.keymap.set(
  { "x", "n" },
  "<leader>gb",
  snacks.picker.git_branches,
  { noremap = true, desc = "Git Branch" }
)

vim.keymap.set(
  { "x", "n" },
  "<leader>p",
  snacks.picker.buffers,
  { noremap = true, desc = "Open buffers" }
)

vim.keymap.set(
  { "n" },
  "<leader>ls",
  snacks.picker.lsp_symbols,
  { desc = "Document Symbols" }
)

vim.keymap.set(
  { "n" },
  "<leader>lt",
  snacks.picker.lsp_type_definitions,
  { desc = "Type Definitions" }
)
vim.keymap.set(
  { "n" },
  "<leader>lw",
  snacks.picker.lsp_workspace_symbols,
  { desc = "Workspace Symbols" }
)

vim.keymap.set(
  { "n", "x" },
  "<leader>fh",
  snacks.picker.help,
  { silent = true, noremap = true, desc = "Find Help" }
)
vim.keymap.set("n", "<leader>fm", snacks.picker.man, { desc = "Man Page" })
vim.keymap.set("n", "<leader>ud", function()
  snacks.toggle.dim():toggle()
end, { desc = "Toggle Dim" })

vim.keymap.set(
  { "n", "x" },
  "<leader>sg",
  snacks.picker.grep,
  { silent = true, noremap = true, desc = "Grep Live" }
)

vim.keymap.set({ "n", "t" }, "<leader>t", function()
  Snacks.terminal.toggle()
end, { desc = "Toggle terminal" })
