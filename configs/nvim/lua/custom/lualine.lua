local hide_in_width = function()
  return vim.fn.winwidth(0) > 100
end

local mode = {
  'mode',
  fmt = function(str)
    return str
  end,
}

local filename = {
  'filename',
  file_status = true,
  path = 1,
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn', 'info', 'hint' },
  symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local diff = {
  'diff',
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  cond = hide_in_width,
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    --theme = 'palenight',
    theme = 'auto',
    section_separators = { left = '░', right = '░' },
    component_separators = { left = '|', right = '|' },
    disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
    always_divide_middle = true,
  },
  
  sections = {
  },
  inactive_sections = {
  },
  tabline = {},
  winbar = {
    lualine_a = { mode },
    lualine_b = { 'branch',diff, },
    lualine_c = {  },
    lualine_x = {  { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width },{'location', cond = hide_in_width }, {'progress', cond = hide_in_width } },
    lualine_y = { diagnostics, },
    lualine_z = {  filename},},
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {{'branch', cond = hide_in_width },diff},
    lualine_c = {  },
    lualine_x = {  },
    lualine_y = {diagnostics},
    lualine_z = {{ 'filename', path = 1 }},
  },
  extensions = { 'fugitive' },
}

-- Hide the bottom statusline since we render lualine in the winbar
vim.o.laststatus = 0
-- Don't show the cursor position in the command/status bar
vim.o.ruler = false
