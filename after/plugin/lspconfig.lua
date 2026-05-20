require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "jdtls",
    "stylua",
    "gopls",
    "rust_analyzer",
    "clangd",
  },
})

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("clangd")
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

require("luasnip.loaders.from_vscode").lazy_load()

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle blink.cmp updates",
  group = vim.api.nvim_create_augroup(
    "nvim-blink-pack-change-hlr",
    { clear = true }
  ),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "blink.cmp" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("blink.lib")
        vim.cmd.packadd("blink.cmp")
      end
      vim.notify("Blink.cmp updated, running build", vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok, blink = pcall(require, "blink.cmp")
      blink.build():wait(60000)
      if ok then
        vim.notify("blink.cmp built successfully", vim.log.levels.INFO)
      else
        vim.notify("blink.cmp build failed", vim.log.levels.WARN)
      end
    end
  end,
})

require("blink.cmp").setup({
  signature = { enabled = true },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
        columns = {
          { "kind_icon", "label", "label_description", gap = 1 },
          { "kind" },
        },
      },
    },
  },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

capabilities = vim.tbl_deep_extend('force', capabilities, {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
})

if capabilities.workspace then
  capabilities.workspace.didChangeWatchedFiles = nil
end
vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.o.complete = "o,.,w,b,u"
      vim.opt.completeopt = "menuone,popup,fuzzy,noselect,noinsert,nosort"
      vim.lsp.completion.enable(true, client.id, args.buf)
    end
  end,
})
