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
    require('custom.neotree').setup_file_operations()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
    require('custom.neotree').setup_window_picker()
    end,
    keys = {
      { '<leader>es', ':Neotree toggle position=right<CR>', silent = true, desc = '[E]xplorer [S]ide' },
      { '<leader>ef', ':Neotree toggle float<CR>', silent = true, desc = '[E]xplorer [F]loat' },
      { '<leader>eg', ':Neotree float git_status<CR>', silent = true, desc = '[E]xplorer [G]it Status Window' },
    },
  },
}
