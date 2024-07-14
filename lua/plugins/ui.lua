return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "j-hui/fidget.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      progress = {
        display = {
          done_ttl = 5,
          done_icon = " ",
        },
      },

      notification = {
        override_vim_notify = true,
        window = {
          x_padding = 0,
          y_padding = 0,
        },
      },
    },
  },
}
