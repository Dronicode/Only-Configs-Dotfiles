return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    local terminal_group = vim.api.nvim_create_augroup("SnacksTerminalKeymaps", { clear = true })
    vim.api.nvim_create_autocmd("TermOpen", {
      group = terminal_group,
      pattern = "term://*",
      callback = function(event)
        local term_opts = { buffer = event.buf, silent = true }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], term_opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], term_opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], term_opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], term_opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], term_opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], term_opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], term_opts)
        vim.keymap.set("t", "q", [[<C-\><C-n><cmd>close<CR>]], term_opts)
        vim.keymap.set("n", "q", "<cmd>close<CR>", term_opts)
      end,
    })
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
