require("nvim-treesitter.config").setup({
    modules = { {
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
        },
        indent = {
            enable = true,
        }
    }, },
    ensure_installed = { "c", "java", "vim", "lua", "vimdoc", "query", "markdown", "kotlin", "go" },
    sync_install = true,
    ignore_install = {},
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    }
})

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Handle ts updates",
    group = vim.api.nvim_create_augroup("nvim-ts-pack-change-hlr", { clear = true }),
    callback = function(ev)
        if ev.data.kind == 'update' then
            vim.notify("TreeSitter updated, running TSUpdate", vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok, _ = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify("TSUpdate completed successfully", vim.log.levels.INFO)
            else
                vim.notify("TSUpdate failed", vim.log.levels.WARN)
            end
        end
    end
})
