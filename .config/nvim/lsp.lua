local configs = require('lspconfig.configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config.tailwindcss = {
  cmd = { "/Users/nick/.config/nvim/language-servers/node_modules/.bin/tailwindcss-language-server", "--stdio" },
  filetypes = {
    -- html
    'aspnetcorerazor',
    'astro',
    'astro-markdown',
    'blade',
    'clojure',
    'django-html',
    'htmldjango',
    'edge',
    'eelixir', -- vim ft
    'elixir',
    'ejs',
    'erb',
    'eruby', -- vim ft
    'gohtml',
    'gohtmltmpl',
    'haml',
    'handlebars',
    'hbs',
    'html',
    'htmlangular',
    'html-eex',
    'heex',
    'jade',
    'leaf',
    'liquid',
    'markdown',
    'mdx',
    'mustache',
    'njk',
    'nunjucks',
    'php',
    'razor',
    'slim',
    'twig',
    -- css
    'css',
    'less',
    'postcss',
    'sass',
    'scss',
    'stylus',
    'sugarss',
    -- js
    'javascript',
    'javascriptreact',
    'reason',
    'rescript',
    'typescript',
    'typescriptreact',
    -- mixed
    'vue',
    'svelte',
    'templ',
  },
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = {
        'class',
        'className',
        'class:list',
        'classList',
        'ngClass',
      },
      includeLanguages = {
        eelixir = 'html-eex',
        eruby = 'erb',
        templ = 'html',
        htmlangular = 'html',
      },
    },
  },
  on_new_config = function(new_config)
    if not new_config.settings then
      new_config.settings = {}
    end
    if not new_config.settings.editor then
      new_config.settings.editor = {}
    end
    if not new_config.settings.editor.tabSize then
      -- set tab size for hover
      new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
    end
  end,
  root_markers = {".git",
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.mjs',
    'tailwind.config.ts',
    'postcss.config.js',
    'postcss.config.cjs',
    'postcss.config.mjs',
    'postcss.config.ts',
  },
}

-- Rust language server setup
require'lspconfig'.rust_analyzer.setup({
  capabilities = capabilities,
})

vim.lsp.config.sourcekit = {
  cmd = { 'sourcekit-lsp' },
  filetypes = { 'swift', 'objc', 'objcpp', 'c', 'cpp' },
  root_markers = {".git", "buildServer.json", '*.xcodeproj', '*.xcworkspace', 'compile_commands.json', 'Package.swift'},
  get_language_id = function(_, ftype)
    local t = { objc = 'objective-c', objcpp = 'objective-cpp' }
    return t[ftype] or ftype
  end,
  capabilities = {
    textDocument = {
      diagnostic = {
        dynamicRegistration = true,
        relatedDocumentSupport = true,
      },
    },
  },
}

vim.lsp.config.yamlls = {
  cmd = { "/Users/nick/.config/nvim/language-servers/node_modules/.bin/yaml-language-server", "--stdio" },
  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab' },
  root_markers = {".git"},
  single_file_support = true,
  settings = {
    redhat = { telemetry = { enabled = false } },
  },
}

vim.lsp.config.jsonls = {
  cmd = { "/Users/nick/.config/nvim/language-servers/node_modules/.bin/vscode-json-languageserver", "--stdio" },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = {".git"},
  single_file_support = true,
}

vim.lsp.config.rubocop = {
  cmd = { 'bin/rubocop', '--lsp' },
  filetypes = { 'ruby' },
  root_markers = {".git", "Gemfile", "Gemfile.lock"},
  init_options = {
    safeAutocorrect = false,
  }
}

vim.lsp.config.ttags = {
  cmd = { 'ttags', 'lsp' },
  filetypes = { 'ruby', 'rust', 'javascript', 'haskell' },
  root_markers = {".git"},
}

vim.lsp.config.ruby_locals = {
  cmd = { "/Users/nick/.config/nvim/language-servers/ruby_locals" },
  filetypes = {"ruby", "eruby"},
  root_markers = {"Gemfile", "Gemfile.lock"},
}

vim.lsp.enable({'ruby_locals', 'ttags', 'rubocop', 'jsonls', 'yamlls', 'sourcekit', 'tailwindcss'})
