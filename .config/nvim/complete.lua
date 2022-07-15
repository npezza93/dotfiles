local cmp     = require('cmp')
local tabnine = require('cmp_tabnine.config')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

tabnine:setup({
  max_lines = 1000;
  max_num_results = 2;
  sort = false;
  run_on_every_keystroke = true;
})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s", }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s", }),
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'path', max_item_count = 2 },
    { name = 'tags', max_item_count = 2 },
    { name = 'cmp_tabnine', priority = 5000 },
    { name = 'luasnip', max_item_count = 3 }
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        luasnip = "[SN]",
        path = "[PTH]",
        tags = "[TAG]",
        cmp_tabnine = "[TN]",
      })
    })
  },
})
