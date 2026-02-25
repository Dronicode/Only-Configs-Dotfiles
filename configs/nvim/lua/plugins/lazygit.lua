return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  init = function()
    -- Revert to plugin's border logic but force the character set
    vim.g.lazygit_floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.api.nvim_set_hl(0, 'LazyGitBorder', { link = 'FloatBorder' })
    vim.api.nvim_set_hl(0, 'LazyGitFloat', { link = 'NormalFloat' })

    -- Inject the TITLE after the plugin initializes the window
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'lazygit',
      callback = function()
        local function apply_title()
          local win = vim.api.nvim_get_current_win()
          if not win or not vim.api.nvim_win_is_valid(win) then
            return
          end

          local cfg = vim.api.nvim_win_get_config(win)
          if cfg.relative ~= '' then
            cfg.title = ' Lazygit '
            cfg.title_pos = 'center'
            cfg.border = 'rounded'
            pcall(vim.api.nvim_win_set_config, win, cfg)
          end
        end

        -- Execute immediately and then again slightly later to ensure it sticks
        vim.schedule(apply_title)
        vim.defer_fn(apply_title, 100)
      end,
    })
  end,
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