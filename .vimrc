let mapleader = "\<Space>"
syntax on
filetype plugin indent on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set wildmenu
set showmatch
set smartindent
set autoindent

highlight LineNr guifg=#636883
highlight CursorLineNr guifg=#abaebf

call plug#begin('~/.local/share/nvim/plugged')
Plug 'npezza93/fozzie.vim'
call plug#end()

inoremap <c-x><c-]> <c-]>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <esc> :noh<return><esc>
nnoremap <C-S> :w<cr>
inoremap <C-S> <esc>:w<cr>
map <leader>gf :e <cfile><cr>

nmap k gk
nmap j gj

nnoremap <leader>r :call FozzieCommand('ctags -f - --sort=no --excmd=number ' . expand('%:p'), ":", "split --delimiter=\"\t\" -f0 -o2")<cr>
nnoremap <leader>e :call FozzieCommand("fd -H -E .git --type file --color=never .", ":e", "--lines=9")<cr>
nnoremap <leader>v :call FozzieCommand("fd -H -E .git --type file --color=never .", ":vs", "--lines=14")<cr>
nnoremap <leader>s :call FozzieCommand("fd -H -E .git --type file --color=never .", ":sp", "--lines=14")<cr>
nnoremap <leader>t :call FozzieCommand("fd -H -E .git --type file --color=never .", ":tabe", "--lines=14")<cr>
