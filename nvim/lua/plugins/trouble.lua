return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { '<leader>da', '<cmd>Trouble diagnostics toggle<cr>', desc = '[D]iagnostics [A]ll' },
    { '<leader>db', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = '[D]iagnostics [B]uffer' },
    { '<leader>dl', '<cmd>Trouble loclist toggle<cr>', desc = '[D]iagnostics [L]ocation list' },
    { '<leader>dq', '<cmd>Trouble qflist toggle<cr>', desc = '[D]iagnostics [Q]uickfix list' },
  },
}
