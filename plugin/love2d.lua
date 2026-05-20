vim.pack.add({
  "https://github.com/S1M0N38/love2d.nvim",
})

local ok, love2d = pcall(require, "love2d.nvim")
if not ok then
  vim.notify("Could not load love2d", vim.log.levels.ERROR)
  return
end
love2d.setup()

vim.keymap.set(
  { "n", "x" },
  "<leader>Vv",
  "<cmd>LoveRun<cr>",
  { desc = "Run LÖVE" }
)
vim.keymap.set(
  { "n", "x" },
  "<leader>Vs",
  "<cmd>LoveStop<cr>",
  { desc = "Stop LÖVE" }
)
