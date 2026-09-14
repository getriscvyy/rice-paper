vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true, desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>f', ':Neotree focus<CR>', { silent = true, desc = 'Focus Neo-tree' })
vim.keymap.set('n', '<leader>b', function()
	vim.cmd('w')
	local ft = vim.bo.filetype
	if ft == 'python' then
		vim.cmd('vsplit | term python3 %')
	elseif ft == 'cpp' or ft == 'c' then
		vim.cmd('vsplit | term g++ % -o /tmp/a.out && /tmp/a.out')
	else
		print('No run command for filetype: ' .. ft)
	end
end, { desc = 'Run current file' })

