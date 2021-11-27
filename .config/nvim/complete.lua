local cmp = require('cmp')
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
  max_lines = 1000;
  max_num_results = 2;
  sort = false;
  run_on_every_keystroke = true;
})

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

vim.g.UltiSnipsRemoveSelectModeMappings = 0
vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "custom_snippets" }

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
      elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        press("<ESC>:call UltiSnips#JumpForwards()<CR>")
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif check_back_space() then
      -- elseif has_any_words_before() then
        press("<Tab>")
      else
        -- fallback()
        cmp.mapping.confirm({ select = true })
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    { name = 'path', max_item_count = 2 },
    { name = 'tags', max_item_count = 2 },
    { name = 'cmp_tabnine', priority = 5000 },
    { name = 'ultisnips', max_item_count = 3 },
  }
})
