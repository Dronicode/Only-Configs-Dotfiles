local copilot_chat = require 'custom.copilot_chat'

return {
  {
    'github/copilot.vim',
    config = function()
      require 'custom.copilot'
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      model = 'claude-haiku-4.5', -- Use claude haiku 4.5 as the default 0.33x model
      debug = false,
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = '<leader>cR',
          insert = '',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        yank_diff = {
          normal = 'gy',
        },
        show_diff = {
          normal = 'gd',
        },
        show_info = {
          normal = 'gi',
        },
        show_context = {
          normal = 'gc',
        },
      },
      prompts = {
        Explain = {
          prompt = '/COPILOT_EXPLAIN\n Explain the selected code.',
          mapping = '<leader>ce',
          description = 'Explain code',
          modes = { 'v', 'n' },
        },
        Review = {
          prompt = '/COPILOT_REVIEW\n Review the selected code.',
          mapping = '<leader>cr',
          description = 'Review code',
          modes = { 'v', 'n' },
        },
        Fix = {
          prompt = '/COPILOT_FIX\n Fix the selected code.',
          mapping = '<leader>cx',
          description = 'Fix code',
          modes = { 'v', 'n' },
        },
        Optimize = {
          prompt = '/COPILOT_OPTIMIZE\n Optimize the selected code.',
          mapping = '<leader>co',
          description = 'Optimize code',
          modes = { 'v', 'n' },
        },
        Tests = {
          prompt = '/COPILOT_TESTS\n Generate tests for the selected code.',
          mapping = '<leader>ct',
          description = 'Generate tests',
          modes = { 'v', 'n' },
        },
        Docs = {
          prompt = '/COPILOT_DOCS\n Generate documentation for the selected code. Please follow Google Python Style Guide for docstrings, ensure full compatibility with Ruff linting rules, and use strict type hints (mypy/pyright style).',
          mapping = '<leader>cd',
          description = 'Generate docs (Strict Python)',
          modes = { 'v', 'n' },
        },
        BetterDocs = {
          prompt = '/COPILOT_DOCS\n Help me write documentation for this code. Let\'s make it consistent with the project style.',
          description = 'Better Documentation Prompt',
        },
      },
    },
    keys = {
      { '<leader>cc', ':CopilotChatToggle<CR>', desc = '[C]opilot [C]hat Toggle' },
      { '<leader>cq', ':CopilotChatQuick<CR>', desc = '[C]opilot Quick [Q]uestion' },
      { '<leader>chs', copilot_chat.save_picker, desc = '[C]opilot [H]istory [S]ave' },
      { '<leader>chl', copilot_chat.load_picker, desc = '[C]opilot [H]istory [L]oad' },
      { '<leader>chd', copilot_chat.delete_picker, desc = '[C]opilot [H]istory [D]elete' },
      { '<leader>cp', function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end, desc = '[C]opilot [P]rompt Actions' },
      { '<leader>ce', ':CopilotChatExplain<CR>', desc = '[C]opilot [E]xplain' },
      { '<leader>cr', ':CopilotChatReview<CR>', desc = '[C]opilot [R]eview' },
      { '<leader>cx', ':CopilotChatFix<CR>', desc = '[C]opilot Fi[x]' },
      { '<leader>co', ':CopilotChatOptimize<CR>', desc = '[C]opilot [O]ptimize' },
      { '<leader>ct', ':CopilotChatTests<CR>', desc = '[C]opilot [T]ests' },
      { '<leader>cd', ':CopilotChatDocs<CR>', desc = '[C]opilot [D]ocs' },
      { '<leader>cba', function()
          local actions = require("CopilotChat.actions")
          actions.append_to_prompt("#buffer: active")
        end, desc = '[C]opilot Append [B]uffer: [A]ctive to prompt' },
      { '<leader>cbl', function()
          local actions = require("CopilotChat.actions")
          actions.append_to_prompt("#buffer: listed")
        end, desc = '[C]opilot Append [B]uffer: [L]isted to prompt' },
    },
    config = function(_, opts)
      require('CopilotChat').setup(opts)
    end,
  },
}
