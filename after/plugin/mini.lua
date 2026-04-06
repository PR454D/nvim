require("mini.icons").setup()
require("mini.statusline").setup()
local mini_pairs = require("mini.pairs")
local mini_notify = require("mini.notify")

mini_pairs.setup()
local notify_win_config = function()
  local has_statusline = vim.o.laststatus > 0
  local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
  return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
end

mini_notify.setup({
  content = {
    -- Use notification message as is for LSP progress
    format = function(notif)
      if notif.data.source == "lsp_progress" then
        return notif.msg
      end
      return MiniNotify.default_format(notif)
    end,

    -- Show more recent notifications first
    sort = function(notif_arr)
      table.sort(notif_arr, function(a, b)
        return a.ts_update > b.ts_update
      end)
      return notif_arr
    end,
  },
  lsp_progress = {
    enable = true,
    level = "TRACE",
    duration_last = 100,
  },
  window = {
    config = notify_win_config,
  },
})

vim.notify = mini_notify.make_notify({
  ERROR = { duration = 2000, hl_group = "DiagnosticError" },
  WARN = { duration = 1500, hl_group = "DiagnosticWarn" },
  INFO = { duration = 2000, hl_group = "DiagnosticInfo" },
  DEBUG = { duration = 0, hl_group = "DiagnosticHint" },
  TRACE = { duration = 0, hl_group = "DiagnosticOk" },
  OFF = { duration = 0, hl_group = "MiniNotifyNormal" },
})
