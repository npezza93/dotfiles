function calculateWidth()
  local columns = vim.api.nvim_get_option('columns')

  local calculated_width = vim.fn.float2nr(columns) < 120
  and vim.fn.float2nr(columns) - 10
  or vim.fn.float2nr(columns) * 3 / 8

  return math.floor(calculated_width + 10)
end

require('fine-cmdline').setup({
  cmdline = {
    prompt = ' ❯ '
  },
  popup = {
    position = {
      col = math.ceil((vim.api.nvim_get_option('columns') - calculateWidth())/2),
      row = math.ceil((vim.api.nvim_get_option('lines') - 17) / 2),
    },
    size = {
      width = calculateWidth(),
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FineCmdFloatBorder',
    },
  },
})
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

vim.api.nvim_set_hl(0, 'FineCmdFloatBorder', { fg = "#FAB387", bg = "NONE" })
