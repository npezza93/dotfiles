nnoremap <leader>r :call FozzieCommand('ctags -f - --sort=no --excmd=number ' . expand('%:p'), ":", 15, "-l14 split --delimiter=\"\t\" -f0 -o2")<cr>
nnoremap <leader>e :call FozzieCommand("fd -H -E .git --type file --color=never .", ":e", 15, "--lines=14")<cr>
nnoremap <leader>v :call FozzieCommand("fd -H -E .git --type file --color=never .", ":vs", 15, "--lines=14")<cr>
nnoremap <leader>s :call FozzieCommand("fd -H -E .git --type file --color=never .", ":sp", 15, "--lines=14")<cr>
nnoremap <leader>t :call FozzieCommand("fd -H -E .git --type file --color=never .", ":tabe", 15, "--lines=14")<cr>
