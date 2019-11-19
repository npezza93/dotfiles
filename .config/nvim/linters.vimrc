let g:ale_linters = {
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1
hi SpellCap guifg=NONE gui=undercurl guisp=#72b7b5
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

nnoremap <leader>1 :ALEFix<cr>
