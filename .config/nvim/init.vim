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

call plug#begin('~/.local/share/nvim/plugged')

Plug 'yuttie/comfortable-motion.vim'
Plug 'connorholyday/vim-snazzy'
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

call plug#end()

let g:lightline = {
\ 'colorscheme': 'snazzy',
\ 'component_function': {
\   'filename': 'LightlineFilename',
\ },
\ 'active': {
\   'right': [ [ 'lineinfo' ], [ 'filetype' ] ]
\ },
\ }
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif
let g:onedark_color_overrides = {
\ "red": { "gui": "#FF5C57", "cterm": "204", "cterm16": "1" },
\ "dark_red": { "gui": "#FF5C57", "cterm": "196", "cterm16": "9" },
\ "green": { "gui": "#5AF78E", "cterm": "114", "cterm16": "2" },
\ "yellow": { "gui": "#F3F99D", "cterm": "180", "cterm16": "3" },
\ "dark_yellow": { "gui": "#F3F99D", "cterm": "173", "cterm16": "11" },
\ "blue": { "gui": "#57C7FF", "cterm": "39", "cterm16": "4" },
\ "purple": { "gui": "#FF6AC1", "cterm": "170", "cterm16": "5" },
\ "cyan": { "gui": "#9AEDFE", "cterm": "38", "cterm16": "6" },
\ "white": { "gui": "#F1F1F0", "cterm": "145", "cterm16": "7" },
\ "black": { "gui": "#282A36", "cterm": "235", "cterm16": "0" },
\ "visual_black": { "gui": "NONE", "cterm": "NONE", "cterm16": "0" },
\ "comment_grey": { "gui": "#5C6370", "cterm": "59", "cterm16": "15" },
\ "gutter_fg_grey": { "gui": "#4B5263", "cterm": "238", "cterm16": "15" },
\ "cursor_grey": { "gui": "#313545", "cterm": "236", "cterm16": "8" },
\ "visual_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "15" },
\ "menu_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "8" },
\ "special_grey": { "gui": "#3B4048", "cterm": "238", "cterm16": "15" },
\ "vertsplit": { "gui": "#181A1F", "cterm": "59", "cterm16": "15" },
\}
colorscheme onedark

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:surround_no_mappings = 1

function! SurroundOp(char)
    if v:operator ==# 'd'
        return "\<plug>D" . a:char . "urround"
    elseif v:operator ==# 'c'
        return "\<plug>C" . a:char . "urround"
    elseif v:operator ==# 'y'
        return "\<plug>Y" . a:char . "urround"
    endif
    return ''
endfunction

omap <expr> s '<esc>'.SurroundOp('s')
omap <expr> S '<esc>'.SurroundOp('S')

" Copied from vim-surround surround.vim:
imap <C-S> <Plug>Isurround
imap <C-G>s <Plug>Isurround
imap <C-G>S <Plug>ISurround<Paste>

function! s:completed(winid, filename, action, ...) abort
    bdelete!
    call win_gotoid(a:winid)
    if filereadable(a:filename)
      let lines = readfile(a:filename)
      if !empty(lines)
        exe a:action . ' ' . lines[0]
      endif
      call delete(a:filename)
    endif
endfunction

function! FzyCommand(choice_command, vim_command)
    let file = tempname()
    let winid = win_getid()
    let cmd = split(&shell) + split(&shellcmdflag) + [a:choice_command . ' | fzy --prompt="❯ " > ' . file]
    let F = function('s:completed', [winid, file, a:vim_command])
    botright 10 new
    call termopen(cmd, {'on_exit': F})
    setlocal nonumber norelativenumber
    startinsert
endfunction

nnoremap <leader>e :call FzyCommand("rg -l .", ":e ")<cr>
nnoremap <leader>v :call FzyCommand("rg -l .", ":vs ")<cr>
nnoremap <leader>s :call FzyCommand("rg -l .", ":sp ")<cr>
nnoremap <leader>t :call FzyCommand("rg -l .", ":tabedit ")<cr>
" nnoremap <leader>f :call FzyCommand("rg --column --line-number --hidden --ignore-case --no-heading --color=always . ", ":e")<cr>
" nnoremap <leader>/ :call
" command! -nargs=* -complete=file Rg :call FzyCommand("rg --column --line-number --hidden --ignore-case --no-heading --color=always . ", ":e")(<q-args>)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <esc> :noh<return><esc>

let g:better_whitespace_enabled=1
let g:better_whitespace_guicolor='#ff5c57'
function! s:StripWhiteSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')

    :%s/\s\+$//e
    :%s#\($\n\s*\)\+\%$##e

    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
autocmd BufWritePre * call s:StripWhiteSpaces()
nnoremap <C-S> :w<cr>

highlight CursorLineNR guifg='#6494ed'
runtime macros/matchit.vim
