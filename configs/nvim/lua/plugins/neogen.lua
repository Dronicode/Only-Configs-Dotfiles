return {
  {
    'danymat/neogen',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require 'custom.neogen'
    end,
    keys = {
      {
        '<leader>nd',
        function()
          require('neogen').generate {}
        end,
        desc = '[N]eogen Generate [D]ocstring',
      },
    },
  },
}
