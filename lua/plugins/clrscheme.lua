return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  config = function()
    function SplashMe(color)
      color = color or "tokyonight-moon"
      vim.cmd.colorscheme(color)
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end

    SplashMe()

    -- require('colorizer').setup()
    -- vim.cmd([[ colorscheme tokyonight-moon ]])
  end,
}
