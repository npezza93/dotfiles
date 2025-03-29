call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'tpope/vim-repeat'                                                        " Makes dot work with everything
Plug 'karb94/neoscroll.nvim'                                                   " Makes scrolling smoooooth
Plug 'tpope/vim-surround'                                                      " Adds surround motion
Plug 'ggandor/leap.nvim'                                                       " Two letter motion
Plug 'ggandor/flit.nvim'
Plug 'christoomey/vim-tmux-navigator'                                          " Makes navigating in tmux and vim easier
Plug 'chrisbra/csv.vim'

" Git related plugins
Plug 'nvim-lua/plenary.nvim'                                                   " General lua functions for neovim
Plug 'lewis6991/gitsigns.nvim'                                                 " Indicates added, modified and removed lines in a file

" Ruby (Tags and such)
Plug 'npezza93/vim-tags'                                                       " Load tag files for ruby and gems
Plug 'npezza93/vim-rails'
Plug 'npezza93/vim-ruby'                                                       " Ruby stuff
Plug 'Wansmer/treesj'                                                          " Toggles ruby blocks. Rewrite with tree sitter

" Theme
Plug 'npezza93/catppuccin.vim', {'as': 'catppuccin', 'do': 'CatppuccinCompile'}
Plug 'itchyny/lightline.vim'                                                   " Adds status bar at bottom

" Tree view
Plug 'kyazdani42/nvim-web-devicons'                                            " Adds devicon integration on tree viewer
Plug 'kyazdani42/nvim-tree.lua'                                                " Adds tree viewer

" Tree sitter
Plug 'npezza93/nvim-treesitter', {'do': ':TSUpdate'}                           " Enables tree sitter features
Plug 'nvim-treesitter/nvim-treesitter-textobjects'                             " Adds tree sitter text objects
Plug 'RRethy/nvim-treesitter-endwise'                                          " Auto adds end when using if, class, etc
Plug 'andymass/vim-matchup'                                                    " Enhances % jumping

" LSP like features and snippets
Plug 'npezza93/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Searching
Plug 'mileszs/ack.vim'                                                         " Search across project
Plug 'npezza93/fozzie.vim'                                                     " Fuzzy file searching

" cmd line stuff
Plug 'npezza93/fine-cmdline.nvim'
Plug 'MunifTanjim/nui.nvim'

Plug 'supermaven-inc/supermaven-nvim'

call plug#end()
