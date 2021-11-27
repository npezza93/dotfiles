sign define DiagnosticSignError text=• texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarning text=• texthl=DiagnosticSignWarning linehl= numhl=
sign define DiagnosticSignInformation text=• texthl=DiagnosticSignInformation linehl= numhl=
sign define DiagnosticSignHint text=• texthl=DiagnosticSignHint linehl= numhl=

highlight SpellCap guifg=NONE gui=undercurl guisp=#72b7b5
highlight DiagnosticUnderlineError gui=undercurl guifg=NONE guisp=#FF5C57

function! EchoCurrentDiagnosticMessage()
  let diagnostics = luaeval("current_diagnostic_messages()")

  if len(diagnostics) > 0
    echom diagnostics[0]['message']
  else
    redraw | echo "\r\r"
  endif
endfunction

autocmd CursorMoved,CursorHold * call EchoCurrentDiagnosticMessage()
