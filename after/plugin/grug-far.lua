local ok, grugfar = pcall(require, "grug-far")

if not ok then
    vim.notify("Could not load grug-far", vim.log.levels.ERROR)
    return
end

grugfar.setup({})

vim.keymap.set("n", "<leader>fr", vim.cmd.GrugFar, { silent = true, noremap = true, desc = "Find & Replace" })
