-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

local tool_filetypes = {
	['CopilotChat'] = true,
	['copilot-chat'] = true,
	['neo-tree'] = true,
}

local function is_content_window(winid)
	if not vim.api.nvim_win_is_valid(winid) then
		return false
	end

	local config = vim.api.nvim_win_get_config(winid)
	if config.relative ~= '' then
		return false
	end

	local bufnr = vim.api.nvim_win_get_buf(winid)
	local filetype = vim.bo[bufnr].filetype
	local buftype = vim.bo[bufnr].buftype

	if tool_filetypes[filetype] then
		return false
	end

	return buftype == '' or buftype == 'acwrite' or buftype == 'terminal'
end

local function smart_close_split()
	local current_win = vim.api.nvim_get_current_win()

	if not is_content_window(current_win) then
		vim.cmd 'close'
		return
	end

	local remaining_content_windows = 0
	local remaining_windows = 0

	for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		if winid ~= current_win then
			local config = vim.api.nvim_win_get_config(winid)
			if config.relative == '' then
				remaining_windows = remaining_windows + 1
				if is_content_window(winid) then
					remaining_content_windows = remaining_content_windows + 1
				end
			end
		end
	end

	if remaining_windows > 0 and remaining_content_windows == 0 then
		Snacks.bufdelete()
		return
	end

	vim.cmd 'close'
end

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
vim.keymap.set('n', '<leader>x', function()
	Snacks.bufdelete()
end, opts) -- close buffer
vim.keymap.set('n', '<leader>B', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>>', '<C-w>v', opts) -- split window vertically (leader + >)
vim.keymap.set('n', '<leader><', '<C-w>s', opts) -- split window horizontally (leader + <)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', smart_close_split, opts) -- close current split window
vim.keymap.set('n', '<leader>sx', '<C-w>x', opts) -- [s]wap split windows e[x]change

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

-- Reload custom Lua modules
vim.keymap.set('n', '<leader>rr', function()
	-- Resolve the custom Lua directory inside your Neovim config
	local config = vim.fn.stdpath 'config'
	local custom_dir = config .. '/lua/custom'
	local files = vim.fn.globpath(custom_dir, '**/*.lua', false, true)
	local modules = {}
	local errors = {}

	-- Convert each file path into a Lua module name (custom.foo.bar)
	for _, file in ipairs(files) do
		local module = file
			:gsub('^' .. vim.pesc(custom_dir .. '/'), 'custom.')
			:gsub('%.lua$', '')
			:gsub('/', '.')
		table.insert(modules, module)
	end

	-- Keep reload order deterministic so behavior is consistent every time
	table.sort(modules)
	-- Load colors first so plugin highlight overrides can apply after it
	for index, module in ipairs(modules) do
		if module == 'custom.colortheme' then
			table.remove(modules, index)
			table.insert(modules, 1, module)
			break
		end
	end

	-- Only reload modules that are currently loaded to avoid errors when
	-- plugin-backed modules or optional files are present but the plugin is
	-- disabled. This makes the reload operation safe and idempotent.
	local to_reload = {}
	for _, module in ipairs(modules) do
		if package.loaded[module] then
			table.insert(to_reload, module)
		end
	end

	-- If colortheme is loaded, ensure it reloads first so highlight changes
	-- take effect before other modules.
	for index, module in ipairs(to_reload) do
		if module == 'custom.colortheme' then
			table.remove(to_reload, index)
			table.insert(to_reload, 1, module)
			break
		end
	end

	if #to_reload == 0 then
		vim.notify('No loaded custom modules to reload', vim.log.levels.INFO)
		return
	end

	-- Unload then re-require each loaded module; capture failures for visibility
	for _, module in ipairs(to_reload) do
		package.loaded[module] = nil
		local ok, err = pcall(require, module)
		if not ok then
			table.insert(errors, string.format('%s: %s', module, err))
		end
	end

	-- Force UI refresh so statusline/tabline-driven plugins redraw immediately
	vim.cmd 'redrawtabline'
	vim.cmd 'redrawstatus'
	vim.cmd 'redraw!'

	-- Surface any reload problems instead of failing silently
	if #errors > 0 then
		vim.notify('Reloaded with errors:\n' .. table.concat(errors, '\n'), vim.log.levels.ERROR)
		return
	end

	vim.notify('Reloaded custom modules', vim.log.levels.INFO)
end, { desc = 'Reload custom modules', noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
	vim.diagnostic.jump { count = -1, float = false }
	vim.diagnostic.open_float()
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
	vim.diagnostic.jump { count = 1, float = false }
	vim.diagnostic.open_float()
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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
