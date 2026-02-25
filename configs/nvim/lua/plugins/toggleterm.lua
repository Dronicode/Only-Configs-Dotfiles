return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    direction = 'horizontal', -- or 'vertical', 'float'
    close_on_exit = true,
    float_opts = {
      border = 'rounded',
      title_pos = 'center',
    },
    highlights = {
      FloatBorder = {
        guifg = '#bb9af7',
        guibg = 'NONE',
      },
      FloatTitle = {
        guifg = '#7dcfff',
        guibg = 'NONE',
      },
    },
  },
  config = function(_, opts)
    local function set_float_title(term, title)
      if term.direction ~= 'float' or not term.window then
        return
      end

      vim.schedule(function()
        if not term.window or not vim.api.nvim_win_is_valid(term.window) then
          return
        end

        local cfg = vim.api.nvim_win_get_config(term.window)
        cfg.title = title
        cfg.title_pos = 'center'
        pcall(vim.api.nvim_win_set_config, term.window, cfg)
      end)
    end

    opts.on_open = function(term)
      set_float_title(term, ' Terminal ')
    end

    require('toggleterm').setup(opts)
    
    -- Exit terminal mode with Esc
    local terminal_group = vim.api.nvim_create_augroup('ToggleTermKeymaps', { clear = true })
    vim.api.nvim_create_autocmd('TermOpen', {
      group = terminal_group,
      pattern = 'term://*toggleterm#*',
      callback = function(event)
        local term_opts = { buffer = event.buf, silent = true }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], term_opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], term_opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], term_opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], term_opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], term_opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], term_opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], term_opts)
        vim.keymap.set('t', 'q', [[<C-\><C-n><cmd>close<CR>]], term_opts)
        vim.keymap.set('n', 'q', '<cmd>close<CR>', term_opts)
      end,
    })

    -- Custom terminals
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'rounded',
        title_pos = 'center',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        set_float_title(term, ' Lazygit ')
        vim.cmd 'startinsert!'
        -- Remove terminal-mode mappings that interfere with Lazygit navigation
        local opts = { buffer = term.bufnr }
        pcall(vim.keymap.del, 't', '<esc>', opts)
        pcall(vim.keymap.del, 't', 'jk', opts)
        pcall(vim.keymap.del, 't', '<C-h>', opts)
        pcall(vim.keymap.del, 't', '<C-j>', opts)
        pcall(vim.keymap.del, 't', '<C-k>', opts)
        pcall(vim.keymap.del, 't', '<C-l>', opts)
        -- We keep `q` if it was mapped, or just delete it if we want lazygit 'q' to work
        -- Since we mapped 'q' to close in TermOpen, we should delete it here too
        pcall(vim.keymap.del, 't', 'q', opts)
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
        title_pos = 'center',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        set_float_title(term, ' Htop ')
        vim.cmd 'startinsert!'
        -- Remove mappings that interfere with Htop
        local opts = { buffer = term.bufnr }
        pcall(vim.keymap.del, 't', '<esc>', opts)
        pcall(vim.keymap.del, 't', 'jk', opts)
        pcall(vim.keymap.del, 't', '<C-h>', opts)
        pcall(vim.keymap.del, 't', '<C-j>', opts)
        pcall(vim.keymap.del, 't', '<C-k>', opts)
        pcall(vim.keymap.del, 't', '<C-l>', opts)
        pcall(vim.keymap.del, 't', 'q', opts)
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
