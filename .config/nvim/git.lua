local cp = require("catppuccin.palettes").get_palette()

require('gitsigns').setup {
  signs = {
    add          = { text = '│'},
    change       = { text = '│'},
    delete       = { text = '_'},
    topdelete    = { text = '‾'},
    changedelete = { text = '│'},
    untracked    = { text = '│'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,
  linehl = false,
}

vim.api.nvim_set_hl(0, 'GitSignsAdd',    { fg = cp.green, bg = 'none' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = cp.yellow, bg = 'none' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = cp.red, bg = 'none' })
