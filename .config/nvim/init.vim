let mapleader = "\<Space>"

source $HOME/.config/nvim/general.vimrc
source $HOME/.config/nvim/plugins.vimrc
source $HOME/.config/nvim/theme.vimrc
source $HOME/.config/nvim/lightline.vimrc
source $HOME/.config/nvim/surround.vimrc
source $HOME/.config/nvim/whitespace.vimrc
source $HOME/.config/nvim/fuzzy_file.vimrc
source $HOME/.config/nvim/scrolling.vimrc
source $HOME/.config/nvim/linters.vimrc
source $HOME/.config/nvim/complete.vimrc

inoremap <c-x><c-]> <c-]>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <esc> :noh<return><esc>
nnoremap <C-S> :w<cr>
inoremap <C-S> <esc>:w<cr>
map <leader>gf :e <cfile><cr>

nmap k gk
nmap j gj

let g:signify_sign_show_count = 1

" Folding settings
" set foldmethod=syntax   "fold based on syntax (except for haml below)
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
