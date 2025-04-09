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
