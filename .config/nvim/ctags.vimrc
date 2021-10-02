" autocmd FileType ruby let &l:tags = &tags . ',' . system("fd tags $(rbenv prefix)/lib/ruby --glob -t f | paste -sd ',' -")
