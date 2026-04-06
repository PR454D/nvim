local noice = require("noice")
noice.setup({
  presets = {
    -- lsp_doc_border = true,
    inc_rename = true,
  },
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
    popup = {
      border = {
        style = "rounded",
      },
    },
    confirm = {
      border = {
        style = "rounded",
      },
    },
    hover = {
      border = {
        style = "rounded",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  documentation = {
    view = "window",
  },
  cmdline = {
    view = "cmdline_popup",
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    messages = { enabled = false },
    hover = { enabled = false },
    signature = { enabled = true },
  },
})
