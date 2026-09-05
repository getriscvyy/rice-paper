vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>e', ':Neotree toggle <CR>', {silent = true, desc = 'Toggle Neo-tree'})
vim.keymap.set('n', '<leader>f', ':Neotree focus <CR>', {silent = true, desc = 'Focus Neo-tree'})

vim.keymap.set('n', '<leader>b', ':w<CR>:vsplit | term python3 %<CR>', { desc = 'Run Python file' })


