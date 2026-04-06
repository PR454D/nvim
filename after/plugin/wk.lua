local ok, wk = pcall(require,"which-key")

if not ok then
    vim.print("Which key not loaded", vim.log.levels.WARN)
end

wk.setup()
