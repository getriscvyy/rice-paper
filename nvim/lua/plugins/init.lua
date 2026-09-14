vim.pack.add({
	{ src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range('3') },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/lervag/vimtex",
	"https://github.com/neanias/everforest-nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/neovim/nvim-lspconfig",
})

require("plugins.colorscheme")
require("plugins.neotree")
require("plugins.treesitter")
require("plugins.vimtex")
require("config.lsp")

