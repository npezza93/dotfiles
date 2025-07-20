require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
    lookbehind = true, -- NOTE: this is still unofficial; remove if causing issues

    selection_modes = {
      ['@parameter.inner'] = 'v',
      ['@parameter.outer'] = 'v',
      ['@class.inner'] = 'V',
      ['@class.outer'] = 'V',
      ['@function.inner'] = 'V',
      ['@function.outer'] = 'v',
    },

    include_surrounding_whitespace = function(opts)
      return vim.tbl_contains({ "@function.outer", "@class.outer", "@class.inner" }, opts.query_string)
    end,
  },

  move = {
    set_jumps = true,
  },
}

-- SELECT keymaps
local select = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "iM", function() select.select_textobject("@class.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "aM", function() select.select_textobject("@class.outer", "textobjects") end)

vim.keymap.set({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end)

vim.keymap.set({ "x", "o" }, "ib", function() select.select_textobject("@block.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ab", function() select.select_textobject("@block.outer", "textobjects") end)

vim.keymap.set({ "x", "o" }, "ia", function() select.select_textobject("@parameter.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "aa", function() select.select_textobject("@parameter.outer", "textobjects") end)

-- MOVE keymaps
local move = require("nvim-treesitter-textobjects.move")
vim.keymap.set({ "n", "x", "o" }, "<leader>m", function() move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "<leader>M", function() move.goto_previous_start("@function.outer", "textobjects") end)

-- SWAP keymaps
local swap = require("nvim-treesitter-textobjects.swap")
vim.keymap.set("n", "<leader>j", function() swap.swap_next("@function.outer") end)
vim.keymap.set("n", "<leader>l", function() swap.swap_next("@parameter.inner") end)
vim.keymap.set("n", "<leader>k", function() swap.swap_previous("@function.outer") end)
vim.keymap.set("n", "<leader>h", function() swap.swap_previous("@parameter.inner") end)

-- REPEATABLE MOVES
local repeatable = require("nvim-treesitter-textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", repeatable.repeat_last_move_next, { expr = true })
vim.keymap.set({ "n", "x", "o" }, ",", repeatable.repeat_last_move_previous, { expr = true })

-- Optional: make f/F/t/T also repeatable
vim.keymap.set({ "n", "x", "o" }, "f", repeatable.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", repeatable.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", repeatable.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", repeatable.builtin_T_expr, { expr = true })
