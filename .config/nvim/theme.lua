local catppuccin = require("catppuccin")

catppuccin.setup({
  transparent_background = false,
  term_colors = false,
  styles = {
    comments = "italic",
    conditionals = "italic",
    loops = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "NONE",
    operators = "NONE",
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    lightspeed = false,
    markdown = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    nvimtree = {
      enabled = true,
      show_root = false,
      transparent_panel = false,
    },
    treesitter = true,
  }
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

vim.cmd[[colorscheme catppuccin]]
