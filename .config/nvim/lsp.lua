local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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

-- Tailwind language server setup
require'lspconfig'.tailwindcss.setup {
  cmd = { "/Users/nick/.config/nvim/language-servers/node_modules/.bin/tailwindcss-language-server", "--stdio" }
}

-- Rust language server setup
require'lspconfig'.rust_analyzer.setup({
  capabilities = capabilities,
})

-- Diagnostic language server setup for linters
require'lspconfig'.diagnosticls.setup {
  cmd = { "/Users/nick/.config/nvim/language-servers/node_modules/.bin/diagnostic-languageserver", "--stdio" },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false
      }
    ),
  },
  filetypes = {
    "ruby"
  },
  init_options = {
    filetypes = {
      ruby = "rubocop",
    },
    linters = {
      rubocop = {
        rootPatterns = { '.git' },
        command = "rubocop",
        sourceName = "rubocop",
        debounce = 100,
        args = {
          "--format",
          "DiagnosticlsFormatter",
          "--require",
          "/Users/nick/.config/nvim/language-servers/diagnosticls_formatter.rb",
          "--server",
          "--force-exclusion",
          "%filepath"
        },
        parseJson = {
          errorsRoot = "files[0].offenses",
          line = "location.start_line",
          column = "location.start_column",
          endLine = "location.last_line",
          endColumn = "location.last_column",
          message = "${message}",
          security = "severity"
        }
      }
    }
  }
}

function current_diagnostic_messages()
  line_nr = (vim.api.nvim_win_get_cursor(0)[1] - 1)

  return vim.lsp.diagnostic.get_line_diagnostics(0, line_nr, {}, nil)
end

vim.lsp.start({
  name = 'ttags',
  cmd = { "ttags", "lsp" },
  filetypes = { 'ruby', 'rust', 'javascript' },
  root_dir = vim.fn.getcwd()
})
