return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    direction = 'horizontal', -- or 'vertical', 'float'
    close_on_exit = true,
  },
  config = function()
    require('toggleterm').setup()
    -- Exit terminal mode with Esc
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
  end,
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm direction=horizontal<cr>', desc = '[T]oggle [T]erminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]oggle [F]loating terminal' },
  },
}
