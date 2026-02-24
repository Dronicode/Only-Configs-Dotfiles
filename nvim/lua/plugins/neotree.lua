return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    },
    config = function()
        local set_neotree_float_title_hl = function()
          vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#bb9af7' })
          vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { fg = '#7dcfff', bg = 'none', bold = true })
          vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg = '#7dcfff', bg = 'none', bold = true })
        end

        set_neotree_float_title_hl()

        vim.api.nvim_create_autocmd('ColorScheme', {
          group = vim.api.nvim_create_augroup('NeoTreeFloatTitleColors', { clear = true }),
          callback = set_neotree_float_title_hl,
        })

        require("neo-tree").setup({
        source_selector = {
          winbar = false,
          statusline = false,
        },
        popup_border_style = "rounded",
            filesystem = {
                filtered_items = {
                    visible = true,  -- Show hidden files by default
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            window = {
                position = "float",
                width = 30,
          popup = {
            title = "Neotree",
          },
            },
        })
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
    keys = {
      { '<leader>es', ':Neotree toggle position=right<CR>', silent = true, desc = '[E]xplorer [S]ide' },
      { '<leader>ef', ':Neotree toggle float<CR>', silent = true, desc = '[E]xplorer [F]loat' },
      { '<leader>eg', ':Neotree float git_status<CR>', silent = true, desc = '[E]xplorer [G]it Status Window' },
    },
  },
}
