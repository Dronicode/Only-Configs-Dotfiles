local M = {}

function M.setup_terminal_keymaps()
  local terminal_group = vim.api.nvim_create_augroup('SnacksTerminalKeymaps', { clear = true })
  vim.api.nvim_create_autocmd('TermOpen', {
    group = terminal_group,
    pattern = 'term://*',
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
end

return M
