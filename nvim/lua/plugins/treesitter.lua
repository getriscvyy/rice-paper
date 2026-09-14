require('nvim-treesitter').install({ 'python', 'cpp', 'c', 'lua', 'vim', 'vimdoc', 'query' })

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'python', 'cpp', 'c', 'lua', 'vim', 'vimdoc' },
	callback = function()
		vim.treesitter.start()
	end,
})

