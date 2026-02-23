return {
	'folke/which-key.nvim',
	event = 'BufReadPost', -- Load earlier to avoid interference
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		spec = {
			{ '<leader>g', group = '[G]it' },
			{ '<leader>h', group = '[H]unks' },
			{ '<leader>s', group = '[S]earch' },
			{ '<leader>t', group = '[T]erminal/Tabs' },
			{ '<leader>c', group = '[C]ode' },
			{ '<leader>e', group = '[E]xplorer' },
			{ '<leader>w', group = '[W]orkspace' },
			{ '<leader>d', group = '[D]iagnostics' },
		},
		win = {
			border = 'rounded',
			padding = { 1, 2, 1, 2 },
		},
	},
}
