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

function! EchoCurrentDiagnosticMessage()
  let diagnostics = luaeval("current_diagnostic_messages()")

  if len(diagnostics) > 0
    echom diagnostics[0]['message']
  else
    redraw | echo "\r\r"
  endif
endfunction

autocmd CursorMoved,CursorHold * call EchoCurrentDiagnosticMessage()
