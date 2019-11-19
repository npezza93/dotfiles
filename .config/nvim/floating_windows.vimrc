function! FloatingPaddingWindow(width, height, row, col)
  let opts = {
    \ 'relative': 'editor',
    \ 'row': a:row - 1,
    \ 'col': a:col - 2,
    \ 'width': a:width + 4,
    \ 'height': a:height + 2,
    \ 'style': 'minimal'
  \ }

  let buf = nvim_create_buf(v:false, v:true)
  return nvim_open_win(buf, v:true, opts)
endfunction

function! CreateFloatingWindow(width)
  let row = 1
  let col = a:width
  let width = a:width
  let height = 15

  let opts = {
    \ 'relative': 'editor',
    \ 'row': row,
    \ 'col': col,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  return win
endfunction
