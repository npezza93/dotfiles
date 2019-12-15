function! FzyFileCommand(choice_command, vim_command, winid)
    let file = tempname()
    let cmd = split(&shell) + split(&shellcmdflag) + [a:choice_command . ' | fzy --prompt="❯ " --lines=15 > ' . file]
    let F = function('s:fuzzy_file_completed', [a:winid, file, a:vim_command])
    call termopen(cmd, {'on_exit': F})
    setlocal nonumber norelativenumber
    startinsert
endfunction

function! s:fuzzy_file_completed(winid, filename, action, ...) abort
    call win_gotoid(a:winid)
    if filereadable(a:filename)
      let lines = readfile(a:filename)
      if !empty(lines)
        exe a:action . ' ' . lines[0]
      endif
      call delete(a:filename)
    endif
endfunction

function! FzyFileWindow(choice_command, vim_command)
  if (float2nr(&columns) < 80)
    let width = 60
  else
    let width = float2nr(&columns) * 1 / 3
  endif

  let winid = win_getid()
  let s:float_term_padding_win = FloatingPaddingWindow(width, 15, 1, width)

  call CreateFloatingWindow(width, width)

  call FzyFileCommand(a:choice_command, a:vim_command, winid)
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_padding_win, v:true)
  setlocal
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

nnoremap <leader>e :call FzyFileWindow("fd -H -E .git --type file --color=never .", ":e ")<cr>
nnoremap <leader>v :call FzyFileWindow("fd -H -E .git --type file --color=never .", ":vs ")<cr>
nnoremap <leader>s :call FzyFileWindow("fd -H -E .git --type file --color=never .", ":sp ")<cr>
nnoremap <leader>t :call FzyFileWindow("fd -H -E .git --type file --color=never .", ":tabedit ")<cr>
