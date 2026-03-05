return {
  'akinsho/bufferline.nvim',
  enabled = false,
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require "custom.bufferline"
  end,
}
