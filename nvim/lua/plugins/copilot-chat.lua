return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      debug = false,
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
          prompt = '/COPILOT_DOCS\n Generate documentation for the selected code.',
          mapping = '<leader>cd',
          description = 'Generate docs',
          modes = { 'v', 'n' },
        },
      },
    },
    keys = {
      { '<leader>cc', ':CopilotChatToggle<CR>', desc = '[C]opilot [C]hat Toggle' },
      { '<leader>cq', ':CopilotChatQuick<CR>', desc = '[C]opilot Quick [Q]uestion' },
      { '<leader>ce', ':CopilotChatExplain<CR>', desc = '[C]opilot [E]xplain' },
      { '<leader>cr', ':CopilotChatReview<CR>', desc = '[C]opilot [R]eview' },
      { '<leader>cx', ':CopilotChatFix<CR>', desc = '[C]opilot Fi[x]' },
      { '<leader>co', ':CopilotChatOptimize<CR>', desc = '[C]opilot [O]ptimize' },
      { '<leader>ct', ':CopilotChatTests<CR>', desc = '[C]opilot [T]ests' },
      { '<leader>cd', ':CopilotChatDocs<CR>', desc = '[C]opilot [D]ocs' },
    },
  },
}
