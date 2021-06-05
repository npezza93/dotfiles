if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

let g:onedark_color_overrides = {
\ "red": { "gui": "#FF5C57", "cterm": "204", "cterm16": "1" },
\ "dark_red": { "gui": "#FF5C57", "cterm": "196", "cterm16": "9" },
\ "green": { "gui": "#5AF78E", "cterm": "114", "cterm16": "2" },
\ "yellow": { "gui": "#F3F99D", "cterm": "180", "cterm16": "3" },
\ "dark_yellow": { "gui": "#F3F99D", "cterm": "173", "cterm16": "11" },
\ "blue": { "gui": "#57C7FF", "cterm": "39", "cterm16": "4" },
\ "purple": { "gui": "#FF6AC1", "cterm": "170", "cterm16": "5" },
\ "cyan": { "gui": "#9AEDFE", "cterm": "38", "cterm16": "6" },
\ "white": { "gui": "#F1F1F0", "cterm": "145", "cterm16": "7" },
\ "black": { "gui": "#282A36", "cterm": "235", "cterm16": "0" },
\ "visual_black": { "gui": "NONE", "cterm": "NONE", "cterm16": "0" },
\ "comment_grey": { "gui": "#5C6370", "cterm": "59", "cterm16": "15" },
\ "gutter_fg_grey": { "gui": "#4B5263", "cterm": "238", "cterm16": "15" },
\ "cursor_grey": { "gui": "#262626", "cterm": "236", "cterm16": "8" },
\ "visual_grey": { "gui": "#262626", "cterm": "237", "cterm16": "15" },
\ "menu_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "8" },
\ "special_grey": { "gui": "#3B4048", "cterm": "238", "cterm16": "15" },
\ "vertsplit": { "gui": "#181A1F", "cterm": "59", "cterm16": "15" },
\}
" \ "cursor_grey": { "gui": "#313545", "cterm": "236", "cterm16": "8" },
" \ "visual_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "15" },
" \ "menu_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "8" },

colorscheme onedark

highlight CursorLineNR guifg='#6494ed'
highlight Visual gui=reverse

" Cyan
highlight TSAttribute guifg='#9AEDFE'
highlight TSField guifg='#9AEDFE'
highlight TSFuncBuiltin guifg='#9AEDFE'
highlight TSProperty guifg='#9AEDFE'
highlight TSSymbol guifg='#9AEDFE'
highlight TSStringRegex guifg='#9AEDFE'
highlight TSStringEscape guifg='#9AEDFE'

" Purple
highlight TSConditional guifg='#FF6AC1'
highlight TSException guifg='#FF6AC1'
highlight TSInclude guifg='#FF6AC1'
highlight TSKeyword guifg='#FF6AC1'
highlight TSKeywordFunction guifg='#FF6AC1'
highlight TSKeywordOperator guifg='#FF6AC1'
highlight TSRepeat guifg='#FF6AC1'
highlight TSOperator guifg='#FF6AC1'

" Yellow
highlight TSConstructor guifg='#F3F99D'
highlight TSType guifg='#F3F99D'
highlight TSConstant guifg='#F3F99D'
highlight TSBoolean guifg='#F3F99D'
highlight TSFloat guifg='#F3F99D'
highlight TSNumber guifg='#F3F99D'
highlight TSConstBuiltin guifg='#F3F99D'
highlight TSConstMacro guifg='#F3F99D'
highlight TSTypeBuiltin guifg='#F3F99D'

" Blue
highlight TSMethod guifg='#57C7FF'
highlight TSFunction guifg='#57C7FF'

" Red
highlight TSLabel guifg='#FF5C57'
highlight TSTag guifg='#FF5C57'
highlight TSTagDelimiter guifg='#FF5C57'
highlight TSVariableBuiltin guifg='#FF5C57'
highlight TSGlobalVariable guifg='#FF5C57'
highlight TSPunctSpecial guifg='#FF5C57'
highlight TSPunctBracket guifg='#ABB2BF'

" Green
highlight TSString guifg='#5AF78E'
highlight TSLiteral guifg='#5AF78E'

" Dark grey
highlight TSComment guifg='#5C6370'

" White
highlight TSParameter guifg='#ABB2BF'
highlight TSAnnotation guifg='#ABB2BF'
highlight TSCharacter guifg='#ABB2BF'
highlight TSError guifg='#ABB2BF'
highlight TSFuncMacro guifg='#ABB2BF'
highlight TSNamespace guifg='#ABB2BF'
highlight TSNone guifg='#ABB2BF'
highlight TSParameterReference guifg='#ABB2BF'
highlight TSPunctDelimiter guifg='#ABB2BF'
highlight TSText guifg='#ABB2BF'
highlight TSStrong guifg='#ABB2BF'
highlight TSEmphasis guifg='#ABB2BF'
highlight TSUnderline guifg='#ABB2BF'
highlight TSStrike guifg='#ABB2BF'
highlight TSTitle guifg='#ABB2BF'
highlight TSURI guifg='#ABB2BF'
highlight TSMath guifg='#ABB2BF'
highlight TSTextReference guifg='#ABB2BF'
highlight TSEnviroment guifg='#ABB2BF'
highlight TSEnviromentName guifg='#ABB2BF'
highlight TSNote guifg='#ABB2BF'
highlight TSWarning guifg='#ABB2BF'
highlight TSDanger guifg='#ABB2BF'
highlight TSVariable guifg='#ABB2BF'
