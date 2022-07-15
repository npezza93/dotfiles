function! s:load_plugins(t) abort
  luafile $HOME/.config/nvim/treesitter_textobjs.lua
  luafile $HOME/.config/nvim/tree.lua
  luafile $HOME/.config/nvim/lsp.lua
  :LspStart
  call plug#load('vim-rails')
  source  $HOME/.config/nvim/lsp.vimrc
  luafile $HOME/.config/nvim/complete.lua
  luafile $HOME/.config/nvim/snippets.lua
endfunction

augroup user_cmds
  autocmd!
  autocmd VimEnter * call timer_start(50, function('s:load_plugins'))
augroup END
