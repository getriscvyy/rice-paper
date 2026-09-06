vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/lervag/vimtex",
  "https://github.com/catppuccin/nvim",
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

require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  integrations = {
    neotree = true,
  },
}

vim.cmd.colorscheme('catppuccin')

local mauve = '#cba6f7' -- mocha; swap per your flavour

vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = mauve })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = mauve })
vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = mauve, bold = true })

