return {
  {
    "nvim-java/nvim-java",
    event = "VeryLazy",
    priority = 100,
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local vim = vim
      local java = require("java")
      local lspconfig = require("lspconfig")
      java.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.zls.setup({})
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),

        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { silent = true, noremap = true, buffer = event.buf, desc = desc })
          end

          local opts = { silent = true, noremap = true }

          map("<leader>va", vim.lsp.buf.code_action, "List Code actions")
          map("<leader>vrn", vim.lsp.buf.rename, "Smart rename")
          map("K", vim.lsp.buf.hover, "Documentation over Word")
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("<leader>vws", vim.lsp.buf.workspace_symbol, "workspace_symbol")
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)

          -- Diagnostics
          map("<leader>vd", vim.diagnostic.open_float, "Show line diagnostics")
          map("[d", vim.diagnostic.get_prev, "Go to previous diagnostic")
          map("]d", vim.diagnostic.get_next, "Go to next diagnostic")
        end,
      })

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
  },
}
