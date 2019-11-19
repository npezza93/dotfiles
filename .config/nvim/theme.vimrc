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
\ "cursor_grey": { "gui": "#313545", "cterm": "236", "cterm16": "8" },
\ "visual_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "15" },
\ "menu_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "8" },
\ "special_grey": { "gui": "#3B4048", "cterm": "238", "cterm16": "15" },
\ "vertsplit": { "gui": "#181A1F", "cterm": "59", "cterm16": "15" },
\}

colorscheme onedark

highlight CursorLineNR guifg='#6494ed'
