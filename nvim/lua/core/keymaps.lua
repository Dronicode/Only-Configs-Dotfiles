-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>>', '<C-w>v', opts) -- split window vertically (leader + >)
vim.keymap.set('n', '<leader><', '<C-w>s', opts) -- split window horizontally (leader + <)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>tc', ':tabnew<CR>', opts) -- open new tab (leader+tc)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- LSP keymaps (set when LSP attaches to a buffer)
function SetupLspKeymaps(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Navigation
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = '[G]oto [D]efinition' }))
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = '[G]oto [D]eclaration' }))
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = '[G]oto [R]eferences' }))
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = '[G]oto [I]mplementation' }))
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = '[G]oto [T]ype definition' }))

	-- Documentation
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
	vim.keymap.set('i', '<leader>k', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = 'Signature help' }))

	-- Code actions
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = '[C]ode [A]ction' }))
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = '[R]e[n]ame' }))

	-- Formatting
	vim.keymap.set('n', '<leader>cf', function()
		vim.lsp.buf.format { async = true }
	end, vim.tbl_extend('force', opts, { desc = '[C]ode [F]ormat' }))

	-- Workspace
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend('force', opts, { desc = '[W]orkspace [A]dd folder' }))
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend('force', opts, { desc = '[W]orkspace [R]emove folder' }))
	vim.keymap.set('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, vim.tbl_extend('force', opts, { desc = '[W]orkspace [L]ist folders' }))
end

return { SetupLspKeymaps = SetupLspKeymaps }
