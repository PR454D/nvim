local treesitterConfigs = require("nvim-treesitter.configs")
treesitterConfigs.setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "html", "javascript", "c", "lua", "vim", "java", "python", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  ignore_install = { "css" },
  modules = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },
  },
})
