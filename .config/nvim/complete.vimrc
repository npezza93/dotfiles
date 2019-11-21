let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
call deoplete#custom#source('ultisnips', 'rank', 1000)

imap <expr><TAB>
     \ neosnippet#expandable_or_jumpable() ? :
     \   "\<Plug>(neosnippet_expand_or_jump)" :
     \ pumvisible()? "\<C-y>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ deoplete#mappings#manual_complete()
