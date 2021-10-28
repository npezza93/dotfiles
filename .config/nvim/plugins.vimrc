call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'tpope/vim-repeat'                                                        " Makes dot work with everything
Plug 'terryma/vim-smooth-scroll'                                               " Makes scrolling smoooooth
Plug 'tpope/vim-surround'                                                      " Adds surround motion
Plug 'tpope/vim-commentary'                                                    " Adds gcc for turning line into comment
Plug 'tpope/vim-endwise'                                                       " Auto adds end for if's or classes etc.
Plug 'ntpeters/vim-better-whitespace'                                          " Highlights whitespace and removes on save
Plug 'pbrisbin/vim-mkdir'                                                      " When creating a file, creates directory tree if missing
Plug 'justinmk/vim-sneak'                                                      " Two letter motion
Plug 'jiangmiao/auto-pairs'                                                    " Add quote, paren, etc. pairs
Plug 'christoomey/vim-tmux-navigator'                                          " Makes navigating in tmux and vim easier
Plug 'tpope/vim-fugitive'                                                      " Git support inside vim
Plug 'mhinz/vim-signify'                                                       " Indicates added, modified and removed lines in a file
" Plug 'craigemery/vim-autotag'                                                  " Keeps tags file up to date
Plug 'sheerun/vim-polyglot'                                                    " Adds language packs for random file types on demand
Plug 'christoomey/vim-system-copy'                                             " Copy nad paste with clipboard. cp(copy) and cv(paste)
Plug 'szw/vim-maximizer'                                                       " Maximize splits

" Theme
Plug 'tpope/vim-haml'
Plug 'joshdick/onedark.vim'                                                    " One dark theme
Plug 'itchyny/lightline.vim'                                                   " Adds status bar at bottom

" Tree view
Plug 'kyazdani42/nvim-web-devicons'                                            " Adds devicon integration on tree viewer
Plug 'kyazdani42/nvim-tree.lua'                                                " Adds tree viewer

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                    " Enables tree sitter features
Plug 'nvim-treesitter/nvim-treesitter-textobjects'                             " Adds tree sitter text objects
Plug 'nvim-treesitter/playground'                                              " Tree sitter tree explorer
Plug 'andymass/vim-matchup'

" LSP like features
Plug 'neovim/nvim-lspconfig'                                                   " Quickstart configurations for the LSP client
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'SirVer/ultisnips', {'on': []}                                            " Snippet engine
Plug 'honza/vim-snippets'                                                      " Snippet collection
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }                           " Add tabnine completions to nvim-compe

" Ruby
Plug 'tpope/vim-rails'                                                         " Bunch of rails helpers
Plug 'tpope/vim-bundler'                                                       " Makes working with gem source code easier to navigate
" Plug 'jgdavey/vim-blockle'                                                     " Toggles ruby blocks. Rewrite with tree sitter

" Searching
Plug 'mileszs/ack.vim'                                                         " Search across project
Plug 'npezza93/fozzie.vim'                                                     " Fuzzy file searching

" Rust
Plug 'rust-lang/rust.vim'                                                      " Standard rust stuff

Plug 'dstein64/vim-startuptime'

call plug#end()

let g:lazy_load_ulti_snips = 0
function! LazyLoadUltiSnips()
  if !get(g:, 'lazy_load_ulti_snips', 0)
    call plug#load('ultisnips')
    lua require'cmp'.register_source('ultisnips', require'cmp_nvim_ultisnips')
    let g:lazy_load_ulti_snips = 1
  endif
endfunction
autocmd InsertEnter * call LazyLoadUltiSnips()
