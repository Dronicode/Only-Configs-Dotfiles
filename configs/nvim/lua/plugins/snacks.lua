return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    require('custom.snacks').setup_terminal_keymaps()
  end,
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    indent = { enabled = true },
    statuscolumn = { enabled = true },
    lazygit = {
      enabled = true,
      win = {
        position = 'float',
        width = 0.9,
        height = 0.9,
        border = 'rounded',
        title = ' Lazygit ',
        title_pos = 'center',
      },
    },
    terminal = {
      enabled = true,
      win = {
        position = "bottom",
        height = 0.3,
        stack = true,
      },
    },
    scroll = { enabled = true },
    picker = {
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
      layout = { preset = 'ivy' },
      matcher = {
        frecency = true,
        cwd_bonus = true,
        sort_empty = true,
      },
      debug = {
        scores = true,
      },
    },
    notifier = { enabled = true },
    input = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "[T]oggle [T]erminal (count for slot)" },
    {
      "<leader>th",
      function()
        Snacks.terminal.toggle("htop", {
          win = {
            position = "float",
            width = 0.9,
            height = 0.9,
            border = "rounded",
            title = " Htop ",
            title_pos = "center",
          },
        })
      end,
      desc = "[T]oggle [H]top",
    },
    { "<leader>gg", function() Snacks.lazygit.open() end, desc = "[G]it [G]UI (Lazygit)" },
    { "<leader>ss", function()
        Snacks.picker.smart {
          multi = { "buffers", "recent", "files" },
          format = "file",
          matcher = {
            cwd_bonus = true,
            frecency = true,
            sort_empty = true,
          },
          title = "Files",
        }
      end, desc = "[S]earch [S]nacks picker" },
    { "<leader>sB", function() Snacks.picker.buffers() end, desc = "[S]nacks [B]uffers" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "[G]it current [F]ile (Lazygit)" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "[G]it [L]og (Lazygit)" },
  },
}
