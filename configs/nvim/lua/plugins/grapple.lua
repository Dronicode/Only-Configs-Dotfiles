return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git', -- Use git root as scope, or 'cwd' for current directory
    icons = true,
    status = true,
  },
  keys = {
    { '<leader>m', '<cmd>Grapple toggle<CR>', desc = '[M]ark file (Grapple)' },
    { '<leader>M', '<cmd>Grapple toggle_tags<CR>', desc = '[M]arked files (Grapple)' },
    { '<leader>g1', '<cmd>Grapple select index=1<CR>', desc = '[G]rapple file 1' },
    { '<leader>g2', '<cmd>Grapple select index=2<CR>', desc = '[G]rapple file 2' },
    { '<leader>g3', '<cmd>Grapple select index=3<CR>', desc = '[G]rapple file 3' },
    { '<leader>g4', '<cmd>Grapple select index=4<CR>', desc = '[G]rapple file 4' },
  },
}
