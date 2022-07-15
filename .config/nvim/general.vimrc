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
set completeopt=menuone
set wrap

syntax off

" Folding settings
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" runtime macros/matchit.vim

set undodir=~/.vim/undodir
set undofile
set undolevels=1000  " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload

au BufRead,BufNewFile *.md setlocal textwidth=80

let mapleader = "\<Space>"
nnoremap <leader>R :source $MYVIMRC<CR>
inoremap <c-x><c-]> <c-]>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent><esc> :noh<return><esc>
nnoremap <C-S> :w<cr>
inoremap <C-S> <esc>:w<cr>
map <leader>gf :e <cfile><cr>
nnoremap <leader><Tab> >>
nnoremap <S-Tab> <<
vnoremap <leader><Tab> >
vnoremap <S-Tab> <
nmap k gk
nmap j gj
imap <silent><expr> <C-N> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<down>'
smap <silent><expr> <C-N> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<down>'
