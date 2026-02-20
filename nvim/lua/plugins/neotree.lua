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
        require("neo-tree").setup({
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
