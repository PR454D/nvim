local M = {}

table.insert(M, {
  "echasnovski/mini.animate",
  enabled = true,
  -- opts = {},
})

for _, value in pairs(M) do
  value.opts = {}
end

return M
