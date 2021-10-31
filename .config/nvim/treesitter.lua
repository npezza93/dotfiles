local function get_ft_query(ft, type)
  local path = (vim.fn.stdpath("config") .. ("/queries/" .. ft .. "/" .. type .. ".scm"))
  return vim.fn.join(vim.fn.readfile(path), "\n")
end

local vim_ts_queries = require("vim.treesitter.query")

vim_ts_queries.set_query("ruby", "highlights", get_ft_query("ruby", "highlights"))

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "ruby", "rust", "javascript", "c", "comment", "css", "dockerfile", "hcl", "html", "json", "lua", "python", "query", "regex", "scss", "toml", "yaml", "typescript", "vim" },
  matchup = {
    enable = true,
  },
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
    additional_vim_regex_highlighting = true,
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
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["<leader>m"] = "@function.outer",
        -- ["]M"] = "@class.outer",
      },
      -- goto_next_end = {
      --   ["]M"] = "@function.outer",
      --   ["]["] = "@class.outer",
      -- },
      goto_previous_start = {
        ["<leader>M"] = "@function.outer",
        -- ["[M"] = "@class.outer",
      },
      -- goto_previous_end = {
      --   ["[M"] = "@function.outer",
      --   ["[]"] = "@class.outer",
      -- },
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        ["iM"] = "@class.inner",
        ["aM"] = "@class.outer",

        ["im"] = "@function.inner",
        ["am"] = "@function.outer",

        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>j"] = "@function.outer",
        ["<leader>l"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>k"] = "@function.outer",
        ["<leader>h"] = "@parameter.inner",
      },
    },
  },
}