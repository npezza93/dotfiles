" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   incremental_selection = {
"     enable = true,
"     keymaps = {
"       init_selection = "gnt",
"       node_incremental = "grn",
"       scope_incremental = "grc",
"       node_decremental = "grm",
"     },
"   },
"   highlight = {
"     enable = true,
"   },
"   indent = {
"     enable = true
"   }
" }
" EOF
