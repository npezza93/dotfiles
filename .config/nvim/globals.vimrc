let g:did_load_filetypes = 1
let g:use_tree_sitter = 1
let g:loaded_ruby_provider = 0
let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1
let g:ruby_default_path = "/Users/nick/.rbenv/shims/ruby"
let g:ruby_path = "/Users/nick/.rbenv/shims/ruby"
let g:matchup_matchparen_offscreen = {}
let g:ackprg = 'rg --vimgrep'
let ruby_no_expensive = 1
let ruby_no_special_methods = 1
let ruby_no_comment_fold = 1

function! s:setf(filetype) abort
  if &filetype !~# '\<'.a:filetype.'\>'
    let &filetype = a:filetype
  endif
endfunction

func! s:StarSetf(ft)
  if expand("<amatch>") !~ g:ft_ignore_pat
    exe 'setf ' . a:ft
  endif
endfunc

au BufNewFile,BufRead [rR]akefile,*.rake			call s:setf('ruby')
