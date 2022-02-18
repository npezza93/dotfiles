function! s:load_plugins(t) abort
  luafile $HOME/.config/nvim/treesitter_textobjs.lua
  luafile $HOME/.config/nvim/tree.lua
endfunction

augroup user_cmds
  autocmd!
  autocmd VimEnter * call timer_start(50, function('s:load_plugins'))
augroup END

let g:lazy_load_ulti_snips = 0
function! LazyLoadUltiSnips()
  if !get(g:, 'lazy_load_ulti_snips', 0)
    call plug#load('ultisnips')
    lua require'cmp'.register_source('ultisnips', require'cmp_nvim_ultisnips')
    let g:lazy_load_ulti_snips = 1
  endif
endfunction
autocmd InsertEnter * call LazyLoadUltiSnips()
