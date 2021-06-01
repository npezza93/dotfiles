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
" Plug 'sheerun/vim-polyglot'                                                    " Adds language packs for random file types on demand
" Plug 'ludovicchabant/vim-gutentags'                                            " Keeps tags file up to date

" Theme
Plug 'joshdick/onedark.vim'                                                    " One dark regex theme
" Plug 'navarasu/onedark.nvim'                                                   " One dark treesitter theme
Plug 'itchyny/lightline.vim'                                                   " Adds status bar at bottom

" Tree view
Plug 'kyazdani42/nvim-web-devicons'                                            " Adds devicon integration on tree viewer
Plug 'kyazdani42/nvim-tree.lua'                                                " Adds tree viewer

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                    " Enables tree sitter features
Plug 'nvim-treesitter/playground'                                              " Tree sitter tree explorer

" LSP like features
Plug 'dense-analysis/ale', { 'on': [] }                                        " Runs rubocop
Plug 'neovim/nvim-lspconfig'                                                   " Quickstart configurations for the LSP client
Plug 'hrsh7th/nvim-compe', { 'on': [] }                                        " Completion engine
Plug 'SirVer/ultisnips', { 'on': [] }                                          " Snippet engine
Plug 'honza/vim-snippets'                                                      " Snippet collection
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }                         " Add tabnine completions to nvim-compe

" Ruby
Plug 'tpope/vim-rails'                                                         " Bunch of rails helpers
Plug 'tpope/vim-bundler'                                                       " Makes working with gem source code easier to navigate
Plug 'jgdavey/vim-blockle'                                                     " Toggles ruby blocks. Rewrite with tree sitter

" Searching
Plug 'mileszs/ack.vim'                                                         " Search across project
Plug 'npezza93/fozzie.vim'                                                     " Fuzzy file searching

" Rust
Plug 'rust-lang/rust.vim'                                                      " Standard rust stuff

autocmd InsertEnter * call plug#load('ale', 'ultisnips', 'nvim-compe')

call plug#end()
