require('everforest').setup({
  transparent_background_level = 1,
})

vim.cmd.colorscheme('everforest')

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })

local accent = '#a7c080'
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = accent })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = accent })
vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = accent, bold = true })

