return {
  {
    -- TODO:
    "nvim-telescope/telescope.nvim",
    enabled = true,
    priority = 5000,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    enabled = true,
    priority = 5000,
  },
  {
    "xiyaowong/telescope-emoji.nvim",
    enabled = true,
    priority = 5000,
  },
  {
    "doctorfree/cheatsheet.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local ctactions = require("cheatsheet.telescope.actions")
      require("cheatsheet").setup({
        bundled_cheetsheets = {
          enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
          disabled = { "nerd-fonts" },
        },
        bundled_plugin_cheatsheets = {
          enabled = {
            "auto-session",
            "goto-preview",
            "octo.nvim",
            "telescope.nvim",
            "vim-easy-align",
            "vim-sandwich",
          },
          disabled = { "gitsigns" },
        },
        include_only_installed_plugins = true,
        telescope_mappings = {
          ["<CR>"] = ctactions.select_or_fill_commandline,
          ["<A-CR>"] = ctactions.select_or_execute,
          ["<C-Y>"] = ctactions.copy_cheat_value,
          ["<C-E>"] = ctactions.edit_user_cheatsheet,
        },
      })
    end,
  },
}
