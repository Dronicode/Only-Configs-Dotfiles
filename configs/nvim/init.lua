require("core.keymaps")
require("core.options")
require("core.lazy")
require("core.lsp")

vim.api.nvim_set_keymap(
	"n",
	"<leader>ywc",
	":lua require('dronicode.yank_without_comments').yank_without_comments()<CR>",
	{ noremap = true, silent = true }
)
