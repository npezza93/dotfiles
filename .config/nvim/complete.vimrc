lua <<EOF
  -- JSON language server setup
  require'lspconfig'.jsonls.setup {
    cmd = { "/Users/nick/.config/nvim/language-servers/node_modules/.bin/vscode-json-languageserver", "--stdio" },
    filetypes = { 'json' },
    root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd()),
    init_options = {
      provideFormatter = true,
    },
  }

  -- YAML language server setup
  require'lspconfig'.yamlls.setup {
    cmd = { "/Users/nick/.config/nvim/language-servers/node_modules/.bin/yaml-language-server", "--stdio" }
  }

  -- Rust language server setup
  require'lspconfig'.rls.setup {}
EOF

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 100
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.tabnine = v:true

let g:UltiSnipsExpandTrigger="<NOP>"
let g:UltiSnipsJumpForwardTrigger="<NOP>"
let g:UltiSnipsJumpBackwardTrigger="<NOP>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

let g:ulti_back_jump_res = 0
function! CleverTab()
    if UltiSnips#CanExpandSnippet() || UltiSnips#CanJumpForwards()
        call UltiSnips#ExpandSnippetOrJump()
        return ""
    else
        if pumvisible()
            return "\<c-n>"
        elseif s:check_back_space()
            return "\<TAB>"
        else
            call compe#complete('')
            return ""
        endif
    endif
endfunction

function! CleverShiftTab()
    call UltiSnips#JumpBackwards()
    if g:ulti_back_jump_res
        return ""
    else
        if pumvisible()
            return "\<c-p>"
        else
            return "\<S-TAB>"
        endif
    endif
endfunction

inoremap <silent> <tab>    <c-r>=CleverTab()<cr>
snoremap <silent> <tab>    <esc>:call UltiSnips#ExpandSnippetOrJump()<cr>
inoremap <silent> <s-tab>  <c-r>=CleverShiftTab()<cr>
snoremap <silent> <s-tab>  <esc>:call UltiSnips#JumpBackwards()<cr>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
