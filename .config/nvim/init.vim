set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set wildmenu
set showmatch
set smartindent
set autoindent
set noshowmode
set complete-=i
set nocompatible
set splitbelow
set splitright
set backspace=indent,eol,start
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set autoread
set incsearch

call plug#begin('~/.local/share/nvim/plugged')

Plug 'yuttie/comfortable-motion.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'itchyny/lightline.vim'
Plug 'jhawthorn/fzy'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-endwise'
Plug 'Townk/vim-autoclose'

call plug#end()

let g:SnazzyTransparent = 1
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }
colorscheme snazzy

let g:surround_no_mappings = 1

function! SurroundOp(char)
    if v:operator ==# 'd'
        return "\<plug>D" . a:char . "urround"
    elseif v:operator ==# 'c'
        return "\<plug>C" . a:char . "urround"
    elseif v:operator ==# 'y'
        return "\<plug>Y" . a:char . "urround"
    endif
    return ''
endfunction

omap <expr> s '<esc>'.SurroundOp('s')
omap <expr> S '<esc>'.SurroundOp('S')

" Copied from vim-surround surround.vim:
imap    <C-S> <Plug>Isurround
imap      <C-G>s <Plug>Isurround
imap <C-G>S <Plug>ISurround<Paste>

function! s:completed(winid, filename, action, ...) abort
    bdelete!
    call win_gotoid(a:winid)
    if filereadable(a:filename)
      let lines = readfile(a:filename)
      if !empty(lines)
        exe a:action . ' ' . lines[0]
      endif
      call delete(a:filename)
    endif
endfunction

function! FzyCommand(choice_command, vim_command)
    let file = tempname()
    let winid = win_getid()
    let cmd = split(&shell) + split(&shellcmdflag) + [a:choice_command . ' | fzy > ' . file]
    let F = function('s:completed', [winid, file, a:vim_command])
    botright 10 new
    if has('nvim')
        call termopen(cmd, {'on_exit': F})
    else
        call term_start(cmd, {'exit_cb': F, 'curwin': 1})
    endif
    startinsert
endfunction

nnoremap <leader>e :call FzyCommand("rg -l .", ":e ")<cr>
nnoremap <leader>v :call FzyCommand("rg -l .", ":vs ")<cr>
nnoremap <leader>s :call FzyCommand("rg -l .", ":sp ")<cr>
nnoremap <leader>t :call FzyCommand("rg -l .", ":tabedit ")<cr>
nnoremap <leader>f :call FzyCommand("rg --column --line-number --hidden --ignore-case --no-heading --color=always . ", ":e")<cr>
" nnoremap <leader>/ :call 
" command! -nargs=* -complete=file Rg :call FzyCommand("rg --column --line-number --hidden --ignore-case --no-heading --color=always . ", ":e")(<q-args>)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set grepprg=rg\ --vimgrep\ --no-heading
set grepformat^=%f:%l:%c:%m
command -nargs=+ -complete=file Rg silent! grep! <args> | copen | redraw!
nmap <silent> <leader>a :Rg "\b<C-R><C-W>\b"<CR>

