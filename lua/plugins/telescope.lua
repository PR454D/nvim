return {
  {
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
}
