let g:lightline = {
\ 'colorscheme': 'catppuccin',
\ 'component_function': {
\   'filename': 'LightlineFilename',
\ },
\ 'component': {
\   'inactive': 'INACTIVE',
\ },
\ 'active': {
\   'left': [ [ 'mode' ], [ 'readonly', 'filename' ] ],
\   'right': [ [ 'filetype' ] ]
\ },
\ 'inactive': {
\   'left': [ ['inactive'], ['relativepath'] ],
\   'right': [ [ 'filetype' ] ]
\ },
\ }

function! LightlineFilename()
  let modified = &modified ? '*' : ''
  return expand('%:~:.') . modified
endfunction
