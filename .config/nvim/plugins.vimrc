call plug#begin('~/.local/share/nvim/plugged')

" Neovim performance improvements
Plug 'lewis6991/impatient.nvim'

" General
Plug 'tpope/vim-repeat'                                                        " Makes dot work with everything
Plug 'karb94/neoscroll.nvim'                                                   " Makes scrolling smoooooth
Plug 'tpope/vim-surround'                                                      " Adds surround motion
Plug 'numToStr/Comment.nvim'                                                   " Adds gcc for turning line into comment
Plug 'ggandor/lightspeed.nvim'                                                 " Two letter motion
" Plug 'ZhiyuanLck/smart-pairs'                                                  " Auto close parens, quote, etc.
Plug 'christoomey/vim-tmux-navigator'                                          " Makes navigating in tmux and vim easier
Plug 'christoomey/vim-system-copy'                                             " Copy nad paste with clipboard. cp(copy) and cv(paste)
Plug 'chrisbra/csv.vim'

" Git related plugins
Plug 'nvim-lua/plenary.nvim'                                                   " General lua functions for neovim
Plug 'lewis6991/gitsigns.nvim'                                                 " Indicates added, modified and removed lines in a file

" Ruby (Tags and such)
" Plug 'craigemery/vim-autotag'                                                  " Keeps tags file up to date
Plug 'npezza93/vim-tags'                                                       " Load tag files for ruby and gems
Plug 'npezza93/vim-rails'
Plug 'npezza93/vim-ruby'                                                       " Ruby stuff
Plug 'AndrewRadev/splitjoin.vim'                                               " Toggles ruby blocks. Rewrite with tree sitter

" Theme
Plug 'npezza93/catppuccin.vim', {'as': 'catppuccin', 'do': 'CatppuccinCompile'}
Plug 'itchyny/lightline.vim'                                                   " Adds status bar at bottom

" Tree view
Plug 'kyazdani42/nvim-web-devicons'                                            " Adds devicon integration on tree viewer
Plug 'kyazdani42/nvim-tree.lua'                                                " Adds tree viewer

" Tree sitter
Plug 'npezza93/nvim-treesitter', {'do': ':TSUpdate'}                           " Enables tree sitter features
Plug 'npezza93/nvim-treesitter-textobjects'                                    " Adds tree sitter text objects
Plug 'RRethy/nvim-treesitter-endwise'                                          " Auto adds end when using if, class, etc
Plug 'andymass/vim-matchup'                                                    " Enhances % jumping

" LSP like features and snippets
Plug 'neovim/nvim-lspconfig', {'on': []}                                       " Quickstart configurations for the LSP client
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }                           " Add tabnine completions to nvim-compe

" Searching
Plug 'mileszs/ack.vim'                                                         " Search across project
Plug 'npezza93/fozzie.vim'                                                     " Fuzzy file searching

" Debugging vim stuff
" Plug 'nvim-treesitter/playground'                                              " Tree sitter tree explorer
" Plug 'dstein64/vim-startuptime'

call plug#end()

lua require('impatient')
