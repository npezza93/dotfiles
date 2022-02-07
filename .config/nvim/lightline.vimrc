let s:colors = onedark#GetColors()

let s:red =    [ s:colors.red.gui, "1" ]
let s:green =  [ s:colors.green.gui, "2" ]
let s:yellow = [ s:colors.yellow.gui, "3" ]
let s:blue =   [ s:colors.blue.gui, "4" ]
let s:cyan =   [ s:colors.cyan.gui, "6" ]
let s:purple = [ s:colors.purple.gui, "5" ]
let s:white =  [ s:colors.white.gui, "7" ]
let s:black =  [ s:colors.lightline_bg.gui, 0 ]
let s:grey =   [ s:colors.cursor_grey.gui, "8" ]
let s:grey2 =  [ s:colors.menu_grey.gui, "8" ]

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
\   'left': [ ['inactive'], ['relativepath'] ],
\   'right': [ [ 'filetype' ] ]
\ },
\ }

function! LightlineFilename()
  let status = get(b:, 'gitsigns_status_dict', {})

  let changes = get(status, 'removed', 0) + get(status, 'added', 0) + get(status, 'changed', 0)

  let modified = changes > 0 ? '*' : ''

  return expand('%') . modified
endfunction
