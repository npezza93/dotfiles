vim.filetype.add({
  extension = {
    ino = "cpp",
  },
})

require('nvim-treesitter').install({ "cpp", "bash", "ruby", "rust", "javascript", "c", "comment", "css", "dockerfile", "hcl", "html", "json", "lua", "python", "query", "regex", "scss", "toml", "yaml", "typescript", "vim", "embedded_template", "markdown", "swift", "make" })

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "swift",
    "toml",
    "typescript",
    "vim",
    "yaml",
    "make",
    "eruby",
    "eruby.html",
    "embedded_template", -- might be for erb or ejs; depends on your setup
  },
  callback = function() vim.treesitter.start() end,
})

vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

require('match-up').setup({})

local tsj = require('treesj')
tsj.setup({
  use_default_keymaps = false,
  check_syntax_error = true,
  ---If line after join will be longer than max value,
  ---@type number If line after join will be longer than max value, node will not be formatted
  max_join_length = 120,
  ---Cursor behavior:
  ---hold - cursor follows the node/place on which it was called
  ---start - cursor jumps to the first symbol of the node being formatted
  ---end - cursor jumps to the last symbol of the node being formatted
  ---@type 'hold'|'start'|'end'
  cursor_behavior = 'hold',
  ---@type boolean Notify about possible problems or not
  notify = true,
  ---@type boolean Use `dot` for repeat action
  dot_repeat = true,
  ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
  on_error = nil,
})

vim.keymap.set('n', 'gJ', tsj.toggle)
vim.keymap.set('n', 'gS', tsj.toggle)
