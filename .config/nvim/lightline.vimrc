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

" set winbar=%=%#WinbarContent#%{Winbar()}

function! Winbar()
  let modified = &modified ? '*' : ''
  let icon = luaeval("require'nvim-web-devicons'.get_icon_by_filetype('" . &ft . "')")

  return '  ' . icon . ' ' . expand('%:t') . modified . '  '
endfunction
