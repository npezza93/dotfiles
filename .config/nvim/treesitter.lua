require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "ruby", "rust", "javascript", "c", "comment", "css", "dockerfile", "hcl", "html", "json", "lua", "python", "query", "regex", "scss", "toml", "yaml", "typescript", "vim", "embedded_template" },
  matchup = {
    enable = true,
  },
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "gnt",
  --     node_incremental = "grn",
  --     scope_incremental = "grc",
  --     node_decremental = "grm",
  --   },
  -- },
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  -- indent = {
  --   enable = false
  -- },
  -- query_linter = {
  --   enable = false,
  --   use_virtual_text = true,
  --   lint_events = {"BufWrite", "CursorHold"},
  -- },
}
