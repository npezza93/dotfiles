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

require'lspconfig'.rubocop.setup({})
require'lspconfig'.ttags.setup({})
