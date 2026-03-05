return {
  'sindrets/diffview.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = '[G]it [D]iffview' },
    { '<leader>gce', '<cmd>DiffviewClose<CR>', desc = '[G]it Closing [E]verything' },
  },
  config = function()
    require 'custom.diffview'
  end,
}
