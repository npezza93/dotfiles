call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-repeat'
Plug 'terryma/vim-smooth-scroll'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-ruby/vim-ruby'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'jgdavey/vim-blockle'
Plug 'pbrisbin/vim-mkdir'
Plug 'dense-analysis/ale', { 'on': [] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'honza/vim-snippets'
Plug 'tpope/vim-bundler'
Plug 'craigemery/vim-autotag', { 'on': [] }
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-signify'
Plug 'rust-lang/rust.vim'

autocmd InsertEnter * call plug#load('ultisnips', 'ale', 'vim-autotag')

call plug#end()
