local catppuccin = require("catppuccin")

catppuccin.setup({
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
    suffix = "_compiled"
  },
  transparent_background = true,
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

vim.cmd[[colorscheme catppuccin]]

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
