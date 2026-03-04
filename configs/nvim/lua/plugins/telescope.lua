-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  -- branch = '0.1.x',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'kkharji/sqlite.lua',
    {
      'nvim-telescope/telescope-frecency.nvim',
    },
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'
    local telescope = require 'telescope'
    local file_ignore_patterns = {
      'node_modules', '%.git/', '.venv',
      '%.jpg', '%.jpeg', '%.png', '%.svg', '%.otf', '%.ttf', '%.pdf', '%.zip', '%.tar', '%.gz',
    }

    -- Toggle state for hidden files
    local show_hidden = true

    require('telescope').setup {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'bottom',
            preview_width = 0.6,
            width = { padding = 0 },
            height = { padding = 0 },
          },
        },
        file_ignore_patterns = file_ignore_patterns,
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--trim',
        },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-l>'] = actions.select_default, -- open file
          },
          n = {
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = file_ignore_patterns,
          hidden = show_hidden,
        },
        buffers = {
          initial_mode = 'normal',
          sort_lastused = true,
          -- sort_mru = true,
          mappings = {
            n = {
              ['d'] = actions.delete_buffer,
              ['l'] = actions.select_default,
            },
          },
        },
        marks = {
          initial_mode = 'normal',
        },
        oldfiles = {
          initial_mode = 'normal',
        },
      },
      live_grep = {
        file_ignore_patterns = file_ignore_patterns,
        additional_args = function(_)
          return show_hidden and { '--hidden' } or {}
        end,
      },
      path_display = {
        filename_first = {
          reverse_directories = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        frecency = {
          db_root = vim.fn.stdpath('data') .. '/frecency',
          db_name = 'frecency.sqlite3',
          show_scores = true,
          show_unindexed = true,
          disable_devicons = false,
          workspaces = {
            ['conf'] = vim.fn.stdpath('config'),
          },
          ignore_patterns = { 'node_modules', '%.git/' },
        },
      },
      git_files = {
        previewer = false,
      },
    }

    -- Enable telescope fzf native and frecency extensions
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')
    pcall(telescope.load_extension, 'frecency')

    local function frecency_files(opts, fallback)
      local frecency = telescope.extensions.frecency
      if frecency and frecency.frecency then
        frecency.frecency(vim.tbl_extend('force', {
          workspace = 'CWD',
          show_scores = true,
        }, opts or {}))
      else
        (fallback or builtin.find_files)(opts)
      end
    end

    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing [B]uffers' })
    vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
    vim.keymap.set('n', '<leader>sgf', builtin.git_files, { desc = '[S]earch [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sgc', builtin.git_commits, { desc = '[S]earch [G]it [C]ommits' })
    vim.keymap.set('n', '<leader>sgh', builtin.git_bcommits, { desc = '[S]earch [G]it [H]istory for current file' })
    vim.keymap.set('n', '<leader>sgb', builtin.git_branches, { desc = '[S]earch [G]it [B]ranches' })
    vim.keymap.set('n', '<leader>sgs', builtin.git_status, { desc = '[S]earch [G]it [S]tatus (diff view)' })
    vim.keymap.set('n', '<leader>sf', function()
      frecency_files({ prompt_title = 'Find Files' })
    end, { desc = '[S]earch [F]iles (frecency)' })
    vim.keymap.set('n', '<leader>sF', builtin.find_files, { desc = '[S]earch [F]iles (raw)' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sgr', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]resume' })
    vim.keymap.set('n', '<leader>so', function()
      frecency_files({ prompt_title = 'Oldfiles' }, builtin.oldfiles)
    end, { desc = '[S]earch [o]ld (recent) files (frecency)' })
    vim.keymap.set('n', '<leader>sO', builtin.oldfiles, { desc = '[S]earch [O]ld (recent) files (raw)' })
    vim.keymap.set('n', '<leader>sds', function()
      builtin.lsp_document_symbols {
        symbols = { 'Class', 'Function', 'Method', 'Constructor', 'Interface', 'Module', 'Property' },
      }
    end, { desc = '[S]each LSP document [S]ymbols' })
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Toggle hidden files visibility in telescope
    vim.keymap.set('n', '<leader>st', function()
      show_hidden = not show_hidden
      vim.notify('Show hidden files: ' .. (show_hidden and 'ON (visible)' or 'OFF (hidden)'))
    end, { desc = '[S]earch toggle [T]idden files' })
  end,
}
