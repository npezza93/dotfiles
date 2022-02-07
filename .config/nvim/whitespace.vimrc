function! s:StripWhiteSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')

    :%s/\s\+$//e
    :%s#\($\n\s*\)\+\%$##e

    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

let s:colors = onedark#GetColors()
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=0
let g:better_whitespace_guicolor=s:colors.red.gui

autocmd BufWritePre * call s:StripWhiteSpaces()
