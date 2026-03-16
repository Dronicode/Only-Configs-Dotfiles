vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim. (default: '')
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
vim.o.swapfile = false -- Creates a swapfile (default: true)
vim.o.showtabline = 0 -- Hide builtin tabline (using bufferline.nvim instead)
--vim.o.pumheight = 10 -- Pop up menu height (default: 0)
vim.o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
vim.o.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
--vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
vim.o.undofile = true -- Save undo history (default: false)
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
vim.o.timeout = true -- Required for multi-key mappings like <leader> sequences
vim.o.timeoutlen = 700 -- Gives enough time to complete leader-key combos reliably

-- --- Status Bar ---
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)

-- --- Gutter ---
vim.wo.number = true -- Make line numbers default (default: false)
vim.o.numberwidth = 4 -- Set number column width to 2 (default: 4)
vim.o.relativenumber = true -- Set relative numbered lines (default: false)
--vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')

-- --- Case Sensitivity
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.o.smartcase = true -- Smart case (default: false)

-- --- Indentation ---
vim.o.autoindent = false -- Copy indent from current line when starting new one (default: true)
vim.o.expandtab = true -- Convert tabs to spaces (default: false)
vim.o.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.o.smartindent = true -- Make indenting smarter again (default: false)
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.o.tabstop = 4 -- Insert n spaces for a tab (default: 8)

-- --- Line Wrap ---
vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.o.wrap = false -- Display lines as one long line (default: true)

-- --- Cursor ---
vim.o.cursorline = true -- Highlight the current line (default: false)
vim.o.scrolloff = 15 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)

-- --- Window ---
vim.o.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
vim.o.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
vim.o.winborder = 'rounded' -- Global border style for floating windows/dialogs

-- --- Search ---
vim.o.hlsearch = false -- Set highlight on search (default: true)

-- --- Diagnostics ---
local diagnostic_symbols = {
	[vim.diagnostic.severity.ERROR] = "💀",
	[vim.diagnostic.severity.WARN] = "",
	[vim.diagnostic.severity.INFO] = "",
	[vim.diagnostic.severity.HINT] = "󰌵",
}

local function diagnostic_code_suffix(diagnostic)
	local code = diagnostic.code
	if type(code) == "table" then
		code = code.value or code.target or code.code
	end
	if code == nil or code == "" then
		return ""
	end
	return " [" .. tostring(code) .. "]"
end

vim.diagnostic.config({
	virtual_text = {
		-- don't show the LSP/source name inline; keep it in floats
		source = true ,
		severity = { min = vim.diagnostic.severity.HINT },
		prefix = function(diagnostic)
			return diagnostic_symbols[diagnostic.severity] or ""
		end,
		format = function(diagnostic)
			return diagnostic.message .. diagnostic_code_suffix(diagnostic)
		end,
	},
	underline = true,
	severity_sort = true,
	signs = false,
	float = {
		source = "always",
		severity = { min = vim.diagnostic.severity.HINT },
		header = "",
	},
})

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd('BufReadPost', {
	group = vim.api.nvim_create_augroup('RestoreCursorPosition', { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
