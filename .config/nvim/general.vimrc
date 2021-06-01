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
set cc=80
set cursorline
set termguicolors
set mouse=n
set completeopt=menuone,noselect

runtime macros/matchit.vim

set undodir=~/.vim/undodir
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload"

au BufRead,BufNewFile *.md setlocal textwidth=80

nnoremap <leader>R :source $MYVIMRC<CR>

let g:loaded_ruby_provider = 0
