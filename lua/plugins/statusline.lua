return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight-moon",
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = {
          "alpha",
        },

        component_separators = { left = "─", right = "─" },
        section_separators = { left = "─", right = "─" },
      },
      sections = {
        lualine_a = {
          {
            "filename",
            symbols = { modified = " ", readonly = " ", unnamed = "No name", newfile = "New file" },
          },
        },
        lualine_b = {
          { "branch", icon = { " ", align = "right" } },
        },
        lualine_x = {
          { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          { "filetype", colored = false, icon = { align = "right" } },
        },
      },
      extensions = {
        "nvim-tree",
        "neo-tree",
        "mason",
        "lazy",
        "fzf",
      },
    })
  end,
}
