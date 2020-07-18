let s:colors = onedark#GetColors()

let s:red = [ s:colors.red.gui, s:colors.red.cterm16 ]
let s:green = [ s:colors.green.gui, s:colors.green.cterm16 ]
let s:yellow = [ s:colors.yellow.gui, s:colors.yellow.cterm16 ]
let s:blue = [ s:colors.blue.gui, s:colors.blue.cterm16 ]
let s:cyan = [ s:colors.cyan.gui, s:colors.cyan.cterm16 ]
let s:purple = [ s:colors.purple.gui, s:colors.purple.cterm16 ]
let s:white = [ s:colors.white.gui, s:colors.white.cterm16 ]
let s:black = [ '#000000', 0 ]
let s:grey = [ s:colors.visual_grey.gui, s:colors.cursor_grey.cterm16 ]
let s:grey2 = [ s:colors.menu_grey.gui, s:colors.cursor_grey.cterm16 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'command': {}}
let s:p.normal.left = [ [ s:black, s:blue ], [ s:white, s:grey ] ]
let s:p.normal.middle = [ [ s:grey, s:black ] ]
let s:p.normal.right = [ [ s:grey2, s:black ] ]
let s:p.normal.error = [ [ s:red, s:white ] ]
let s:p.normal.warning = [ [ s:yellow, s:white ] ]
let s:p.insert.left    = [ [ s:black, s:green ], [ s:white, s:grey ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:white, s:grey ] ]
let s:p.visual.left = [ [ s:black, s:purple ], [ s:white, s:grey ] ]
let s:p.command.left = [ [ s:black, s:yellow ], [ s:white, s:grey ] ]
let s:p.inactive.left =  [ [ s:black, s:grey2 ], [s:white, s:grey] ]
let s:p.tabline.left = [ [ s:white, s:grey ] ]
let s:p.tabline.tabsel = [ [ s:black, s:white ] ]
let s:p.tabline.middle = [ [ s:white, s:black ] ]
let s:p.tabline.right = [ [ s:black, s:black ] ]

let g:lightline#colorscheme#snazzy#palette = lightline#colorscheme#flatten(s:p)
let g:lightline = {
\ 'colorscheme': 'snazzy',
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
\   'left': [ ['inactive'], ['filename'] ],
\   'right': [ [ 'filetype' ] ]
\ },
\ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  let modified = &modified ? '*' : ''
  if path[:len(root)-1] ==# root
    return path[len(root)+1:] . modified
  endif
  return expand('%') . modified
endfunction
