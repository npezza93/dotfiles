call plug#begin('~/.local/share/nvim/plugged')

" Neovim performance improvements
Plug 'nathom/filetype.nvim'
Plug 'lewis6991/impatient.nvim'

" General
Plug 'tpope/vim-repeat'                                                        " Makes dot work with everything
Plug 'karb94/neoscroll.nvim'                                                   " Makes scrolling smoooooth
Plug 'tpope/vim-surround'                                                      " Adds surround motion
Plug 'numToStr/Comment.nvim'                                                   " Adds gcc for turning line into comment
Plug 'tpope/vim-endwise'                                                       " Auto adds end for if's or classes etc.
Plug 'ntpeters/vim-better-whitespace'                                          " Highlights whitespace and removes on save
Plug 'pbrisbin/vim-mkdir'                                                      " When creating a file, creates directory tree if missing
Plug 'ggandor/lightspeed.nvim'                                                      " Two letter motion
Plug 'jiangmiao/auto-pairs'                                                    " Add quote, paren, etc. pairs
Plug 'christoomey/vim-tmux-navigator'                                          " Makes navigating in tmux and vim easier
Plug 'christoomey/vim-system-copy'                                             " Copy nad paste with clipboard. cp(copy) and cv(paste)
Plug 'szw/vim-maximizer'                                                       " Maximize splits
Plug 'chrisbra/csv.vim'

" Git related plugins
" Plug 'tpope/vim-fugitive'                                                      " Git support inside vim. slow
Plug 'nvim-lua/plenary.nvim'                                                   " General lua functions for neovim
Plug 'lewis6991/gitsigns.nvim'                                                 " Indicates added, modified and removed lines in a file

" Ruby (Tags and such)
" Plug 'craigemery/vim-autotag'                                                  " Keeps tags file up to date
Plug 'npezza93/vim-tags'
Plug 'vim-ruby/vim-ruby'

" Theme
Plug 'npezza93/onedark.vim'                                                    " One dark theme
Plug 'itchyny/lightline.vim'                                                   " Adds status bar at bottom

" Tree view
Plug 'kyazdani42/nvim-web-devicons'                                            " Adds devicon integration on tree viewer
Plug 'kyazdani42/nvim-tree.lua'                                                " Adds tree viewer

" Tree sitter
Plug 'npezza93/nvim-treesitter', {'do': ':TSUpdate'}                           " Enables tree sitter features
Plug 'npezza93/nvim-treesitter-textobjects'                             " Adds tree sitter text objects
Plug 'andymass/vim-matchup'

" LSP like features and snippets
Plug 'neovim/nvim-lspconfig'                                                   " Quickstart configurations for the LSP client
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'quangnguyen30192/cmp-nvim-ultisnips', { 'commit': '78a9452d61bc7f1c3aeb33f6011513760f705bdf' }
Plug 'SirVer/ultisnips', {'on': []}                                            " Snippet engine
Plug 'honza/vim-snippets'                                                      " Snippet collection
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }                           " Add tabnine completions to nvim-compe

" Ruby
Plug 'npezza93/vim-rails'                                                         " Bunch of rails helpers
" Plug 'jgdavey/vim-blockle'                                                     " Toggles ruby blocks. Rewrite with tree sitter

" Searching
Plug 'mileszs/ack.vim'                                                         " Search across project
Plug 'npezza93/fozzie.vim'                                                     " Fuzzy file searching

" Debugging vim stuff
" Plug 'nvim-treesitter/playground'                                              " Tree sitter tree explorer
" Plug 'dstein64/vim-startuptime'

call plug#end()

lua require('impatient')

let g:lazy_load_ulti_snips = 0
function! LazyLoadUltiSnips()
  if !get(g:, 'lazy_load_ulti_snips', 0)
    call plug#load('ultisnips')
    lua require'cmp'.register_source('ultisnips', require'cmp_nvim_ultisnips')
    let g:lazy_load_ulti_snips = 1
  endif
endfunction
autocmd InsertEnter * call LazyLoadUltiSnips()
