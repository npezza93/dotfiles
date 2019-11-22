let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

call deoplete#custom#source("ultisnips", "rank", 1000)

imap <expr><TAB>
     \ neosnippet#expandable_or_jumpable() ? :
     \   "\<Plug>(neosnippet_expand_or_jump)" :
     \ pumvisible()? "\<C-y>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ deoplete#mappings#manual_complete()
