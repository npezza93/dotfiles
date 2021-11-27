nnoremap <leader>\| :call LazyLoadTree('NvimTreeFindFileToggle')<CR>
nnoremap <leader>\ :call LazyLoadTree('NvimTreeToggle')<CR>

let g:lazy_load_tree = 0
function! LazyLoadTree(tree_cmd)
  if !get(g:, 'lazy_load_tree', 0)
    luafile $HOME/.config/nvim/tree.lua
    let g:lazy_load_tree = 1
  endif
  execute a:tree_cmd
endfunction
