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
set laststatus=3
set ignorecase
set smartcase
set signcolumn=yes:1
set cmdheight=0

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
autocmd FileType ruby setlocal indentkeys-=.
autocmd FileType ruby nnoremap <buffer> <C-]> :<C-u>call TagJumpRuby()<CR>

function! TagJumpRuby()
	let l:orig_keyword = &iskeyword
	set iskeyword+=:
	set iskeyword+=?
	let l:word = expand("<cword>")
	let &iskeyword = l:orig_keyword

  if l:word[0] ==# ':'
    let l:word = l:word[1:]
  endif

	execute "tjump " . l:word
endfunction
autocmd FileType swift setlocal shiftwidth=2 tabstop=2

let mapleader = "\<Space>"
nnoremap <leader>R :source $MYVIMRC<CR>
inoremap <c-x><c-]> <c-]>
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <esc> :silent! noh<return><esc>
nnoremap <silent> <C-S> :silent! w<cr>
inoremap <silent> <C-S> <esc>:silent! w<cr>
map <leader>gf :e <cfile><cr>
nnoremap <leader><Tab> >>
nnoremap <S-Tab> <<
vnoremap <leader><Tab> >
vnoremap <S-Tab> <
nmap k gk
nmap j gj
imap <silent><expr> <C-N> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<down>'
smap <silent><expr> <C-N> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<down>'
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

lua vim.loader.enable()
