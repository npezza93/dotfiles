let g:did_load_filetypes = 1
let g:use_tree_sitter = 1
let g:loaded_ruby_provider = 0
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
