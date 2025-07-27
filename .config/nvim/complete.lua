local cmp     = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local suggestion = require('supermaven-nvim.completion_preview')

require("supermaven-nvim").setup({})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif suggestion.has_suggestion() then
        suggestion.on_accept_suggestion()
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
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end
    }),
    ['<C-e>'] = cmp.mapping.abort(),

  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'path', max_item_count = 2 },
    { name = 'tags', max_item_count = 2 },
    { name = 'luasnip', max_item_count = 3 },
    { name = 'nvim_lsp', max_item_count = 2, priority = 5001 }
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
      })
    })
  },
})

vim.keymap.set("i", "<Right>", function()
  if suggestion and suggestion.has_suggestion() then
    suggestion.on_accept_suggestion()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", true)
  end
end, { silent = true })
