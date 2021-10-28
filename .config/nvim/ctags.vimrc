" let g:rubyTags = system("fd tags $(rbenv prefix)/lib/ruby --glob -t f | paste -sd ',' -")

" autocmd FileType ruby let &l:tags = &tags . ',' . g:rubyTags
