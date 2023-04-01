local builtin = require('telescope.builtin')

vim.keymap.set("", '<leader>ff',builtin.find_files, {})
vim.keymap.set("", '<C-p>',builtin.git_files, {})
vim.keymap.set("", '<leader>lg',builtin.live_grep, {})
vim.keymap.set("", '<leader>bb',builtin.buffers, {})
vim.keymap.set("", '<leader>fh',builtin.help_tags, {})
