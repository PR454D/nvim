return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function(_, opts)
    local conf = vim.tbl_deep_extend("keep", opts, {
      ui = {
        height = 0.8,
        width = 0.6,
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "󰁔",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason").setup(conf)

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        "eslint",
        "zls",
        "rust_analyzer",
      },
    })
  end,
}
