return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', ':UndotreeToggle<CR>', desc = 'Toggle [U]ndotree' },
  },
  config = function()
		require 'custom.undotree'
  end,
}
