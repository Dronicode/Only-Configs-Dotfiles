return {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  config = function()
		require 'custom.surround'
  end,
}
