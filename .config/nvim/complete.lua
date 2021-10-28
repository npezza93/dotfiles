-- Setup nvim-cmp.
local cmp = require'cmp'
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
  max_lines = 1000;
  max_num_results = 2;
  sort = false;
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

vim.g.UltiSnipsRemoveSelectModeMappings = 0
vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "custom_snippets" }

cmp.setup({
  -- documentation = false,
  completion = {
    -- completeopt = 'menu,menuone,noinsert',
    autocomplete = true,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
      elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        vim.fn.feedkeys(t("<ESC>:call UltiSnips#JumpForwards()<CR>"))
      elseif vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-n>"), "n")
      elseif check_back_space() then
        vim.fn.feedkeys(t("<tab>"), "n")
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
        return vim.fn.feedkeys(t("<ESC>:call UltiSnips#JumpBackwards()<CR>"))
      elseif vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-p>"), "n")
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
