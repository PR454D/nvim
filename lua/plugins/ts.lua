return {
  "nvim-treesitter/nvim-treesitter",
  build = { ":TSUpdate" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/playground" },
}
