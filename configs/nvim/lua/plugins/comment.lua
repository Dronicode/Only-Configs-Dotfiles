return {
	'numToStr/Comment.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	config = function()
		require 'custom.comment'
	end,
}
