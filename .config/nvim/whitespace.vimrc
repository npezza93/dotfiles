function! s:StripWhiteSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')

    :%s/\s\+$//e
    :%s#\($\n\s*\)\+\%$##e

    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

let g:strip_whitespace_on_save=0

match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWritePre * call s:StripWhiteSpaces()
