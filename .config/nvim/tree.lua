require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  hijack_directories  = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {'.DS_STORE', 'git'}
  },
  view = {
    width = 30,
    hide_root_folder = true,
    side = 'right',
    mappings = {
      custom_only = false,
      list = {}
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  sort_by = function(nodes)
    table.sort(nodes, function(a, b)
      a_name = a.name
      if a_name:sub(1, 1) == "." then
        a_name = a_name:sub(2)
      end

      b_name = b.name
      if b_name:sub(1, 1) == "." then
        b_name = b_name:sub(2)
      end

      return a_name:lower() < b_name:lower()
    end)
  end
}
