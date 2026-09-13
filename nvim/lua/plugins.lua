vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/lervag/vimtex",
  "https://github.com/neanias/everforest-nvim",
})

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
}

require("everforest").setup({
	transparent_background_level = 1,
})

vim.cmd.colorscheme('everforest')

local mauve = '#a7c080'

vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = mauve })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = mauve })
vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = mauve, bold = true })

