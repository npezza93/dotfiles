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
