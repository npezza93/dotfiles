call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'tpope/vim-repeat'                                                        " Makes dot work with everything
Plug 'terryma/vim-smooth-scroll'                                               " Makes scrolling smoooooth
Plug 'tpope/vim-surround'                                                      " Adds surround motion
Plug 'tpope/vim-commentary'                                                    " Adds gcc for turning line into comment
Plug 'tpope/vim-endwise'                                                       " Auto adds end for if's or classes etc.
Plug 'ntpeters/vim-better-whitespace'                                          " Highlights whitespace and removes on save
Plug 'pbrisbin/vim-mkdir'                                                      " When creating a file, automatically creates directory tree if missing
Plug 'justinmk/vim-sneak'                                                      " Two letter motion
Plug 'jiangmiao/auto-pairs'                                                    " Add quote, paren, etc. pairs
" Plug 'sheerun/vim-polyglot'                                                    " Adds language packs for random file types on demand
Plug 'christoomey/vim-tmux-navigator'                                          " Makes navigating in tmux and vim easier
Plug 'tpope/vim-fugitive'                                                      " Git support inside vim
Plug 'mhinz/vim-signify'                                                       " Indicates added, modified and removed lines in a file
" Plug 'ludovicchabant/vim-gutentags'                                            " Keeps tags file up to date

" Theme
Plug 'joshdick/onedark.vim'
" Plug 'navarasu/onedark.nvim'
Plug 'itchyny/lightline.vim'

" Tree view
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP like features
Plug 'dense-analysis/ale', { 'on': [] }
Plug 'neovim/nvim-lspconfig'                                                   " Quickstart configurations for the LSP client
Plug 'hrsh7th/nvim-compe'
Plug 'SirVer/ultisnips'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }

" Ruby
Plug 'tpope/vim-rails'                                                         " Bunch of rails helpers
Plug 'tpope/vim-bundler'                                                       " Makes working with gem source code easier to navigate
Plug 'jgdavey/vim-blockle'                                                     " Toggles ruby blocks. Rewrite with tree sitter

" Searching
Plug 'mileszs/ack.vim'                                                         " Search across project
Plug 'npezza93/fozzie.vim'                                                     " Fuzzy file searching

" Rust
Plug 'rust-lang/rust.vim'                                                      " Standard rust stuff

" Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'honza/vim-snippets'

autocmd InsertEnter * call plug#load('ale')

call plug#end()
