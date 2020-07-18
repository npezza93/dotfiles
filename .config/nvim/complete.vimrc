let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

call deoplete#custom#source("ultisnips", "rank", 1000)

autocmd InsertEnter * call deoplete#enable()
