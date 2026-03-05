local M = {}

function M.setup_file_operations()
  local set_neotree_float_title_hl = function()
    vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#bb9af7' })
    vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { fg = '#7dcfff', bg = 'none', bold = true })
    vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg = '#7dcfff', bg = 'none', bold = true })
  end

  set_neotree_float_title_hl()

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('NeoTreeFloatTitleColors', { clear = true }),
    callback = set_neotree_float_title_hl,
  })

  require('neo-tree').setup({
    default_component_configs = {
      file_size = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
    },
    source_selector = {
      winbar = false,
      statusline = false,
    },
    popup_border_style = 'rounded',
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
      },
    },
    window = {
      position = 'float',
      width = 30,
      popup = {
        title = 'Neotree',
      },
    },
  })
end

function M.setup_window_picker()
  require('window-picker').setup({
    filter_rules = {
      include_current_win = false,
      autoselect_one = true,
      bo = {
        filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
        buftype = { 'terminal', 'quickfix' },
      },
    },
  })
end

return M
