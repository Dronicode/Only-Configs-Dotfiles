return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'BufReadPost',
  opts = {
    indent = {
      char = '│',
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  },
  config = function(_, opts)
    require('ibl').setup(opts)
    
    -- Toggle indentation guides with <leader>ig
    vim.keymap.set('n', '<leader>ig', function()
      vim.cmd('IBLToggle')
      vim.notify('Indentation guides toggled')
    end, { desc = '[I]ndentation [G]uides toggle' })
  end,
}
