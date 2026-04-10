local leap = require('leap')
leap.opts.vim_opts['go.ignorecase'] = true

do
  local clever_s = require('leap.user').with_traversal_keys('s', 'S')
  vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
    leap.leap { opts = clever_s }
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
    leap.leap { backward = true, opts = clever_s }
  end)
end

do
  local function ft(key_specific_args)
    leap.leap(
      vim.tbl_deep_extend('keep', key_specific_args, {
        inputlen = 1,
        inclusive = true,
        opts = {
          -- Force autojump.
          labels = '',
          -- Match the modes where you don't need labels (`:h mode()`).
          safe_labels = vim.fn.mode(1):match('o') and '' or nil,
        },
      })
    )
  end

  -- A helper function making it easier to set "clever-f" behavior
  -- (using f/F or t/T instead of ;/, - see the plugin clever-f.vim).
  local clever = require('leap.user').with_traversal_keys
  local clever_f, clever_t = clever('f', 'F'), clever('t', 'T')

  vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
    ft { opts = clever_f }
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, 'F', function()
    ft { backward = true, opts = clever_f }
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, 't', function()
    ft { offset = -1, opts = clever_t }
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, 'T', function()
    ft { backward = true, offset = 1, opts = clever_t }
  end)
end

do
  local clever = require('leap.user').with_traversal_keys
  -- For relative directions, set the `backward` flags according to:
  -- local prev_backward = require('leap').state['repeat'].backward
  vim.keymap.set({ 'n', 'x', 'o' }, '<cr>', function()
    leap.leap {
      ['repeat'] = true, opts = clever('<cr>', '<bs>'),
    }
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, '<bs>', function()
    leap.leap {
      ['repeat'] = true, opts = clever('<bs>', '<cr>'), backward = true,
    }
  end)
end
