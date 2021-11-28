require'nvim-treesitter.configs'.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["<leader>m"] = "@function.outer",
      },
      goto_previous_start = {
        ["<leader>M"] = "@function.outer",
      },
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      lookbehind = true,
      selection_modes = {
         ['@parameter.outer'] = 'v', -- charwise
         ['@class.inner'] = 'V',
         ['@class.outer'] = 'V',
         ['@function.inner'] = 'V',
         ['@function.outer'] = 'V',
      },
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
