require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "ruby", "rust", "javascript", "c", "css", "dockerfile", "html", "json", "python", "query", "scss", "toml", "yaml" },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnt",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  -- highlight = {
  --   enable = true,
  -- },
  indent = {
    enable = true
  }
}
