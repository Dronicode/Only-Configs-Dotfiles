return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
	opts = {
		signs = {
			add = { text = '│' },
			change = { text = '│' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map('n', ']c', function()
				if vim.wo.diff then
					return ']c'
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'Next git hunk' })

			map('n', '[c', function()
				if vim.wo.diff then
					return '[c'
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'Previous git hunk' })

			-- Actions
			map('n', '<leader>hs', gs.stage_hunk, { desc = '[H]unk [S]tage' })
			map('n', '<leader>hr', gs.reset_hunk, { desc = '[H]unk [R]eset' })
			map('v', '<leader>hs', function()
				gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
			end, { desc = '[H]unk [S]tage' })
			map('v', '<leader>hr', function()
				gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
			end, { desc = '[H]unk [R]eset' })
			map('n', '<leader>hS', gs.stage_buffer, { desc = '[H]unk [S]tage buffer' })
			map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[H]unk [U]ndo stage' })
			map('n', '<leader>hR', gs.reset_buffer, { desc = '[H]unk [R]eset buffer' })
			map('n', '<leader>hp', gs.preview_hunk, { desc = '[H]unk [P]review' })
			map('n', '<leader>hb', function()
				gs.blame_line { full = true }
			end, { desc = '[H]unk [B]lame line' })
			map('n', '<leader>hd', gs.diffthis, { desc = '[H]unk [D]iff' })

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Git hunk' })
		end,
	},
}
