local builtin = require("telescope.builtin")

local telescope = require("telescope")
local themes = require("telescope.themes")

local open_with_trouble = require("trouble.sources.telescope").open

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = { width = 0.8 },
    },
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      winblend = 15,
      prompt_prefix = "🔍",
      layout_config = {
        center = {
          width = 0.8,
          height = 0.8,
        },
      },
    },
    live_grep = {
      theme = "ivy",
      winblend = 20,
      prompt_prefix = "🔍",
      layout_config = {
        height = 0.6,
        width = 0.5,
      },
    },
    git_files = {
      theme = "dropdown",
      winblend = 15,
      prompt_prefix = " ",
    },
    emojis = {
      theme = "dropdown",
      winblend = 15,
    },
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown({}),
    },
    ["emoji"] = {
      themes.get_ivy(),
      action = function(emoji)
        vim.fn.setreg("*", emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)
      end,
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "emoji")

vim.keymap.set("", "<leader>ff", builtin.find_files, {})
vim.keymap.set("", "<C-p>", builtin.git_files, {})
vim.keymap.set("", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("", "<leader>bb", builtin.buffers, {})
vim.keymap.set("", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("", "<leader>fb", builtin.builtin, {})
vim.keymap.set("", "<leader>tp", builtin.pickers, {})
vim.keymap.set("", "<leader>ee", function()
  telescope.extensions["emoji"].emoji({
    theme = "dropdown",
    winblend = 0,
    prompt_prefix = "🚀🔥> ",
    layout_config = {
      height = 0.6,
      width = 0.8,
    },
  })
end, { noremap = true, silent = true, desc = "Search emojis" })
vim.keymap.set("", "<leader>tc", vim.cmd.Cheatsheet, { desc = "Search cheatsheets" })

vim.keymap.set("", "<leader>gc", builtin.git_commits, {})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})
