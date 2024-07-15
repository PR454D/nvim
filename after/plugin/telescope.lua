local builtin = require("telescope.builtin")

local telescope = require("telescope")
local themes = require("telescope.themes")

local open_with_trouble = require("trouble.sources.telescope").open

telescope.setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.8 },
    },
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
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
        -- argument emoji is a table.
        -- {name="", value="", cagegory="", description=""}

        vim.fn.setreg("*", emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)

        -- insert emoji when picked
        -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
      end,
    },
  },
})

pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "fzf")
telescope.load_extension("emoji")

vim.keymap.set("", "<leader>ff", builtin.find_files, {})
vim.keymap.set("", "<C-p>", builtin.git_files, {})
vim.keymap.set("", "<leader>fs", function()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
vim.keymap.set("", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("", "<leader>bb", builtin.buffers, {})
vim.keymap.set("", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("", "<leader>fb", builtin.builtin, {})
-- vim.keymap.set("n", "<leader>ee", require("telescope-emoji").search, { desc = "Search emojis" })

vim.keymap.set("", "<leader>gc", builtin.git_commits, {})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})
