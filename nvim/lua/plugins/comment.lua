return {
	'numToStr/Comment.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	config = function()
		require('Comment').setup({
			-- Default keybindings:
			-- gcc - toggle line comment
			-- gbc - toggle block comment
			-- gc{motion} - toggle comment with motion (e.g., gc3j for 3 lines down)
			-- gcA - insert comment at end of line
			-- Custom keybindings:
			extra = {
				above = 'gcu', -- insert comment [u]p (above current line)
				below = 'gcd', -- insert comment [d]own (below current line)
			},
		})
	end,
}
