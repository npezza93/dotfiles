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
