vim.filetype.add({ pattern = { ['.*%.js%.erb'] = 'eruby.javascript' } })
vim.treesitter.language.register('embedded_template', 'eruby.javascript')

require('nvim-treesitter').install({ "cpp", "bash", "ruby", "rust", "javascript", "c", "comment", "css", "dockerfile", "hcl", "html", "json", "lua", "python", "query", "regex", "scss", "toml", "yaml", "typescript", "vim", "embedded_template", "markdown", "swift", "make", "arduino", "git_config", "git_rebase", "gitignore" })

local patterns = {
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
  "eruby.javascript",
  "eruby.html",
  "embedded_template"
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft  = vim.bo[buf].filetype

    if vim.tbl_contains(patterns, ft) then
      vim.treesitter.start(buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    else
      vim.treesitter.stop(buf)
      vim.cmd("syntax enable")
    end
  end,
})

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
