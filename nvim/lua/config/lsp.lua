vim.lsp.enable({ 'pyright', 'clangd' })

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	signs = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
	local opts = { buffer = args.buf }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', '<leader>mv', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	end,
})

