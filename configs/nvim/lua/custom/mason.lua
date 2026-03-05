local M = {}

function M.setup(opts)
  require('mason').setup(opts)

  local set_mason_title = function()
    local win = vim.api.nvim_get_current_win()
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative and cfg.relative ~= '' then
      cfg.title = ' Mason '
      cfg.title_pos = 'center'
      pcall(vim.api.nvim_win_set_config, win, cfg)
    end
  end

  vim.api.nvim_set_hl(0, 'MasonHeader', { fg = '#7dcfff', bg = 'none', bold = true })

  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('MasonFloatTitle', { clear = true }),
    pattern = 'mason',
    callback = set_mason_title,
  })
end

return M
