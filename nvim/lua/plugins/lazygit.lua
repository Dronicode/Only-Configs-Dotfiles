return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<CR>', desc = '[G]it [G]UI (Lazygit)' },
    { '<leader>gf', '<cmd>LazyGitCurrentFile<CR>', desc = '[G]it current [F]ile (Lazygit)' },
  },
}