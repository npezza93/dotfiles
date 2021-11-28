nnoremap <silent> <leader>r :call FozzieCommand('ctags -f - --sort=no --excmd=number ' . expand('%:p'), ":", 15, "-l14 split --delimiter=\"\t\" -f0 -o2", "true", "NONE", "#57C7FF", "#F1F1F0")<cr>
nnoremap <silent> <leader>e :call FozzieCommand("fd -H -E .git --type file --color=never --strip-cwd-prefix .", ":e", 15, "--lines=14", "true", "NONE", "#57C7FF", "#F1F1F0")<cr>
nnoremap <silent> <leader>v :call FozzieCommand("fd -H -E .git --type file --color=never --strip-cwd-prefix .", ":vs", 15, "--lines=14", "true", "NONE", "#57C7FF", "#F1F1F0")<cr>
nnoremap <silent> <leader>s :call FozzieCommand("fd -H -E .git --type file --color=never --strip-cwd-prefix .", ":sp", 15, "--lines=14", "true", "NONE", "#57C7FF", "#F1F1F0")<cr>
nnoremap <silent> <leader>t :call FozzieCommand("fd -H -E .git --type file --color=never --strip-cwd-prefix .", ":tabe", 15, "--lines=14", "true", "NONE", "#57C7FF", "#F1F1F0")<cr>
