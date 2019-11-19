function! FzyTagCommand(choice_command, winid)
    let file = tempname()
    let cmd = split(&shell) + split(&shellcmdflag) + [a:choice_command . ' > ' . file]
    let F = function('s:tag_completed', [a:winid, file])
    call termopen(cmd, {'on_exit': F})
    setlocal nonumber norelativenumber
    startinsert
endfunction

function! s:tag_completed(winid, filename, ...) abort
    call win_gotoid(a:winid)
    if filereadable(a:filename)
      let lines = readfile(a:filename)
      if !empty(lines)
        let tag = split(lines[0], "\t")
        exe ':e ' . tag[1]
        call search(tag[2])
        normal ^
      endif
      call delete(a:filename)
    endif
endfunction

function! FzyTagWindow(choice_command, width, col)
  let winid = win_getid()
  let s:float_term_padding_win = FloatingPaddingWindow(a:width, 15, 1, a:col)

  call CreateFloatingWindow(a:width, a:col)

  call FzyTagCommand(a:choice_command, winid)
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_padding_win, v:true)
  setlocal
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

nnoremap <leader>r :call FzyTagWindow('fzy-ctags --lines=15 ' . expand('%:p'), float2nr(&columns) * 1 / 3, float2nr(&columns) * 1 / 3)<cr>
nnoremap <leader>R :call FzyTagWindow('fzy-ctags --lines=15', float2nr(&columns) * 1 / 2, float2nr(&columns) * 1 / 4)<cr>
