local catppuccin = require("catppuccin")

catppuccin.setup({
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
    suffix = "_compiled"
  },
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

vim.cmd[[colorscheme catppuccin]]
