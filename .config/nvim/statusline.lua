local cp = require("catppuccin.palettes").get_palette()
vim.o.showmode = false

vim.o.statusline = table.concat({
  "%#StatusLineMode#",
  " %{v:lua.StatuslineMode()}",
  " %<%#StatusLineFilename#",
  " %{v:lua.StatuslineFilename()} ",
  "%#StatusLineMiddle#",
  "%=",
  "%#StatusLineFiletype#",
  " %{&filetype}"
})

function StatuslineMode()
  local modes = {
    n = "NORMAL",
    no = "N·OPERATOR",
    v = "VISUAL",
    V = "VISUAL",
    [""] = "VISUAL", -- Ctrl-v
    i = "INSERT",
    R = "REPLACE",
    c = "COMMAND",
    s = "SELECT",
    S = "S·LINE",
    [""] = "S·BLOCK", -- Ctrl-s
    t = "TERMINAL"
  }
  return modes[vim.api.nvim_get_mode().mode] or "?"
end

local mode_colors = {
  n = cp.blue,
  i = cp.green,
  v = cp.mauve,
  V = cp.mauve,
  [""] = cp.mauve,
  R = cp.red,
  c = cp.yellow,
  t = cp.pink,
}

function StatuslineFilename()
  local modified = vim.bo.modified and "*" or ""
  local path = vim.fn.expand("%:~:.")
  return path .. modified
end

vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineMode", { fg = cp.mantle, bg = cp.blue })
vim.api.nvim_set_hl(0, "StatusLineFilename", { fg = cp.text, bg = cp.surface0 })
vim.api.nvim_set_hl(0, "StatusLineFiletype", { fg = cp.overlay0, bg = cp.base })
vim.api.nvim_set_hl(0, "StatusLineMiddle", { bg = "none" })

local function update_statusline_mode_highlight()
  local mode = vim.api.nvim_get_mode().mode
  local bg = mode_colors[mode] or cp.subtext0

  vim.api.nvim_set_hl(0, "StatusLineMode", { fg = cp.mantle, bg = bg })
end

vim.api.nvim_create_autocmd("ModeChanged", {
  callback = update_statusline_mode_highlight,
})

vim.o.tabline = "%!v:lua.Tabline()"

function Tabline()
  local s = ""
  local tab_count = vim.fn.tabpagenr('$')
  local current = vim.fn.tabpagenr()

  for i = 1, tab_count do
    local win = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[win]
    local filename = "[No Name]"

    if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
      local name = vim.api.nvim_buf_get_name(bufnr)
      if name ~= "" then
        filename = vim.fn.fnamemodify(name, ":t")
      end
    end

    if i == current then
      s = s .. "%#TabLineSel#"
    else
      s = s .. "%#TabLine#"
    end

    s = s .. "%" .. i .. "T " .. i .. " " .. filename .. " "

    if tab_count >= 3 and i < tab_count then
      local next_is_selected = (i + 1) == current
      local curr_is_selected = i == current

      -- Add pipe only between two *non-selected* tabs
      if not curr_is_selected and not next_is_selected then
        s = s .. "%#TabLine#|"
      end
    end
  end

  s = s .. "%#TabLineFill#%T"
  return s
end

vim.api.nvim_set_hl(0, "TabLineSel",  { fg = cp.base, bg = cp.text })
vim.api.nvim_set_hl(0, "TabLine",     { fg = cp.text, bg = cp.surface0 })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = cp.base })
