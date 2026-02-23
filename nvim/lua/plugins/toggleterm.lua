return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    direction = 'horizontal', -- or 'vertical', 'float'
    close_on_exit = true,
  },
  config = function()
    require('toggleterm').setup()
    -- Exit terminal mode with Esc
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

    -- Custom terminals
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'rounded',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(_)
        vim.cmd 'startinsert!'
      end,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    local htop = Terminal:new {
      cmd = 'htop',
      direction = 'float',
      float_opts = {
        border = 'rounded',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
    }

    function _htop_toggle()
      htop:toggle()
    end
  end,
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm direction=horizontal<cr>', desc = '[T]oggle [T]erminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]oggle [F]loating terminal' },
    { '<leader>tl', '<cmd>lua _lazygit_toggle()<cr>', desc = '[T]oggle [L]azygit' },
    { '<leader>th', '<cmd>lua _htop_toggle()<cr>', desc = '[T]oggle [H]top' },
  },
}
