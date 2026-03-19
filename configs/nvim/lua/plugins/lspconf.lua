return {
    "neovim/nvim-lspconfig",
	init = function()
		require('custom.vale').setup()
	end,
}
