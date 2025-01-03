nnoremap <leader>1 :lua vim.lsp.buf.format()<cr>

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
