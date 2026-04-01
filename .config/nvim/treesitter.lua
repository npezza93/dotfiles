vim.filetype.add({ pattern = { ['.*%.js%.erb'] = 'eruby.javascript' } })
vim.filetype.add({ pattern = { ['.*%.json%.erb'] = 'eruby.json' } })
vim.treesitter.language.register('embedded_template', 'eruby.javascript')
vim.treesitter.language.register('embedded_template', 'eruby.json')

local ruby_access_modifiers = {
  private = true,
  protected = true,
  public = true,
}

local ruby_visibility_containers = {
  class = true,
  module = true,
  singleton_class = true,
}

local function ruby_indent_style()
  local style = vim.g.ruby_indent_access_modifier_style
  if style == 'indent' or style == 'outdent' then
    return style
  end

  return 'normal'
end

local function buf_line(bufnr, lnum)
  return vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1] or ''
end

local function first_nonblank_col(text)
  local _, indent = text:find('^%s*')
  return indent or 0
end

local function ruby_visibility_modifier(node, source)
  if not node or node:type() ~= 'identifier' then
    return nil
  end

  local text = vim.treesitter.get_node_text(node, source)
  if ruby_access_modifiers[text] then
    return text
  end

  return nil
end

local function ruby_visibility_anchor(node)
  local current = node
  while current do
    local parent = current:parent()
    local grandparent = parent and parent:parent() or nil
    if
      parent
      and parent:type() == 'body_statement'
      and grandparent
      and ruby_visibility_containers[grandparent:type()]
    then
      return current
    end
    current = parent
  end

  return nil
end

local function active_ruby_visibility_modifier(anchor, source)
  local sibling = anchor
  while sibling do
    local modifier = ruby_visibility_modifier(sibling, source)
    if modifier then
      return modifier
    end
    sibling = sibling:prev_named_sibling()
  end

  return nil
end

_G.ruby_treesitter_indentexpr = function()
  local base_indent = require('nvim-treesitter.indent').get_indent(vim.v.lnum)
  if base_indent < 0 then
    return base_indent
  end

  local style = ruby_indent_style()
  if style == 'normal' then
    return base_indent
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr, 'ruby', { error = false })
  if not parser then
    return base_indent
  end

  local line = buf_line(bufnr, vim.v.lnum)
  local is_blank_line = line:match('^%s*$') ~= nil
  local ref_lnum = is_blank_line and vim.fn.prevnonblank(vim.v.lnum) or vim.v.lnum
  if ref_lnum < 1 then
    return base_indent
  end

  local ref_line = buf_line(bufnr, ref_lnum)
  local ref_col = first_nonblank_col(ref_line)

  local tree = parser:parse()[1]
  local root = tree and tree:root() or nil
  if not root then
    return base_indent
  end

  local node = root:descendant_for_range(ref_lnum - 1, ref_col, ref_lnum - 1, ref_col + 1)
  local anchor = ruby_visibility_anchor(node)
  if not anchor then
    return base_indent
  end

  local anchor_modifier = ruby_visibility_modifier(anchor, bufnr)
  if style == 'outdent' then
    if anchor_modifier and not is_blank_line and anchor:start() == vim.v.lnum - 1 then
      return math.max(base_indent - vim.fn.shiftwidth(), 0)
    end
    return base_indent
  end

  if anchor_modifier and not is_blank_line and anchor:start() == vim.v.lnum - 1 then
    return base_indent
  end

  local active_modifier = active_ruby_visibility_modifier(anchor, bufnr)
  if active_modifier == 'private' or active_modifier == 'protected' then
    return base_indent + vim.fn.shiftwidth()
  end

  return base_indent
end

local function is_eruby_filetype(ft)
  return ft == 'eruby' or ft:match('^eruby%.') ~= nil
end

require('nvim-treesitter').install({ "cpp", "bash", "ruby", "rust", "javascript", "c", "comment", "css", "dockerfile", "hcl", "html", "json", "lua", "python", "query", "regex", "scss", "toml", "yaml", "typescript", "vim", "embedded_template", "markdown", "swift", "make", "arduino", "git_config", "git_rebase", "gitignore", "gitcommit", "csv" })

local patterns = {
  "bash",
  "c",
  "cpp",
  "css",
  "csv",
  "dockerfile",
  "embedded_template",
  "eruby",
  "eruby.html",
  "eruby.javascript",
  "eruby.json",
  "gitcommit",
  "gitconfig",
  "gitignore",
  "gitrebase",
  "hcl",
  "html",
  "javascript",
  "json",
  "lua",
  "make",
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
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft  = vim.bo[buf].filetype

    if vim.tbl_contains(patterns, ft) then
      vim.treesitter.start(buf)
      if ft == "ruby" then
        vim.bo[buf].indentexpr = "v:lua.ruby_treesitter_indentexpr()"
      elseif is_eruby_filetype(ft) then
        vim.bo[buf].syntax = 'eruby'
        vim.bo[buf].indentexpr = "GetErubyIndent()"
      else
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
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
