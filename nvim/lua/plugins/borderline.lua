return {
  'mikesmithgh/borderline.nvim',
  event = 'VeryLazy',
  config = function()
    local purple = '#bb9af7'
    local cyan = '#7dcfff'

    local function set_float_border_hl()
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = purple })
      vim.api.nvim_set_hl(0, 'FloatTitle', { fg = cyan, bg = 'none', bold = true })
    end

    set_float_border_hl()

    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('BorderlinePurpleFloatBorder', { clear = true }),
      callback = set_float_border_hl,
    })

    require('borderline').setup({
      enabled = true,
      border = {
        { '╭', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╮', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '╯', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╰', 'FloatBorder' },
        { '│', 'FloatBorder' },
      },
    })
  end,
}
