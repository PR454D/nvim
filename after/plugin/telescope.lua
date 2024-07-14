local builtin = require("telescope.builtin")

local telescope = require("telescope")
local themes = require("telescope.themes")

telescope.setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.8 },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      winblend = 15,
      prompt_prefix = "🔍",
    },
    git_files = {
      theme = "dropdown",
      winblend = 15,
      prompt_prefix = " ",
    },
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown({}),
    },
  },
})

pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "fzf")

vim.keymap.set("", "<leader>ff", builtin.find_files, {})
vim.keymap.set("", "<C-p>", builtin.git_files, {})
vim.keymap.set("", "<leader>fs", function()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
vim.keymap.set("", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("", "<leader>bb", builtin.buffers, {})
vim.keymap.set("", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("", "<leader>fb", builtin.builtin, {})

vim.keymap.set("", "<leader>gc", builtin.git_commits, {})
