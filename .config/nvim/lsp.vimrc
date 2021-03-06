sign define LspDiagnosticsSignError text=• texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=• texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=• texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=• texthl=LspDiagnosticsSignHint linehl= numhl=

highlight LspDiagnosticsSignError guifg=#FF6AC1
highlight LspDiagnosticsSignWarning guifg=#FF6AC1
highlight LspDiagnosticsSignInformation guifg=#FF6AC1
highlight LspDiagnosticsSignHint guifg=#FF6AC1
highlight SpellCap guifg=NONE gui=undercurl guisp=#72b7b5
highlight LspDiagnosticsUnderlineError gui=undercurl guifg=NONE guisp=#FF5C57

autocmd CursorMoved,CursorHold * lua echo_current_diagnostic_message()

command RubocopFix call system('rubocop -A '.@%) | :checktime
nnoremap <leader>1 :RubocopFix<cr>
