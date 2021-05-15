let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'rust': ['rls'],
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1
let g:ale_ruby_rubocop_auto_correct_all = 1
hi SpellCap guifg=NONE gui=undercurl guisp=#72b7b5
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

nnoremap <leader>1 :ALEFix<cr>

highlight ALEError gui=undercurl guifg=NONE guisp=#FF5C57
highlight ALEWarning gui=undercurl guifg=NONE guisp=#FF5C57
