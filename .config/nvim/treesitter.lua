local function get_ft_query(ft, type)
  local path = (vim.fn.stdpath("config") .. ("/queries/" .. ft .. "/" .. type .. ".scm"))
  return vim.fn.join(vim.fn.readfile(path), "\n")
end

local vim_ts_queries = require("vim.treesitter.query")

vim_ts_queries.set_query("ruby", "highlights", get_ft_query("ruby", "highlights"))

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
  highlight = {
    enable = true,
  },
  indent = {
    enable = false
  },
  query_linter = {
    enable = false,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}
