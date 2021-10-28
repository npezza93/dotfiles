function! g:Z(query)
  let zdir = system("source /usr/local/etc/profile.d/z.sh; _z " . a:query . " --list 2>&1 | awk 'NR==1 {print $2}'")

  return zdir
endfunction

command -nargs=1 Z execute 'cd' g:Z(<f-args>)
