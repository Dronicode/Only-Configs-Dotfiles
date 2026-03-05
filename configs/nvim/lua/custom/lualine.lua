-- Import color theme based on environment variable NVIM_THEME
local env_var_nvim_theme = os.getenv 'NVIM_THEME' or 'nord'

-- Define a table of themes
local themes = {
  onedark = onedark_theme,
  nord = 'nord',
}

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
  always_visible = true,
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
    theme = 'palenight',
    section_separators = { left = '░', right = '░' },
    component_separators = { left = '|', right = '|' },
    disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { 'branch' },
    lualine_c = { filename },
    lualine_x = { diagnostics, diff, 'fileformat', { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
    lualine_y = { 'location' },
    lualine_z = { 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { { 'location', padding = 0 } },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'fugitive' },
}
