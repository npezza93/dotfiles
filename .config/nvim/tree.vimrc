nnoremap <leader>\| :call LazyLoadTree() \| :NvimTreeFindFile<CR>
nnoremap <leader>\ :call LazyLoadTree() \| :NvimTreeToggle<CR>

let g:lazy_load_tree = 0
function! LazyLoadTree()
  if !get(g:, 'lazy_load_tree', 0)
    luafile $HOME/.config/nvim/tree.lua
    let g:lazy_load_tree = 1
  endif
endfunction
