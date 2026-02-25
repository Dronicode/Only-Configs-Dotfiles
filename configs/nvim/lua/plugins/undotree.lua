return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', ':UndotreeToggle<CR>', desc = 'Toggle [U]ndotree' },
  },
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_DiffpanelHeight = 10
  end,
}
