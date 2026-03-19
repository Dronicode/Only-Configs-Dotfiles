local M = {}

local vale_dir = vim.fn.stdpath('config') .. '/tools/vale'
local vocab_dir = vale_dir .. '/styles/config/vocabularies/dictionaries'

local function ensure_dir(path)
	vim.fn.mkdir(path, 'p')
end

local function ensure_local_vocab_files()
	ensure_dir(vocab_dir)

	local accept_path = vocab_dir .. '/accept.txt'
	local reject_path = vocab_dir .. '/reject.txt'

	if vim.fn.filereadable(accept_path) == 0 then
		vim.fn.writefile({}, accept_path)
	end

	if vim.fn.filereadable(reject_path) == 0 then
		vim.fn.writefile({}, reject_path)
	end
end

local function append_unique_line(file_path, entry)
	local lines = {}
	local file = io.open(file_path, 'r')

	if file then
		for line in file:lines() do
			lines[#lines + 1] = line
			if line == entry then
				file:close()
				return false
			end
		end
		file:close()
	end

	local out = io.open(file_path, 'a')
	if not out then
		error('Unable to open Vale vocabulary file: ' .. file_path)
	end

	if #lines > 0 and lines[#lines] ~= '' then
		out:write('\n')
	end
	out:write(entry .. '\n')
	out:close()

	return true
end

local function normalize_entry(raw)
	local entry = vim.trim(raw or '')
	if entry == '' then
		entry = vim.fn.expand('<cword>')
	end
	return vim.trim(entry)
end

function M.get_config_path()
	ensure_local_vocab_files()
	return vale_dir .. '/.vale.ini'
end

function M.get_vocab_file_path(kind)
	ensure_local_vocab_files()
	return vocab_dir .. '/' .. kind .. '.txt'
end

local function add_to_vocab(kind, raw)
	local entry = normalize_entry(raw)
	if entry == '' then
		vim.notify('No word provided for Vale vocabulary update', vim.log.levels.WARN)
		return
	end

	local file_path = M.get_vocab_file_path(kind)
	local ok, added_or_err = pcall(append_unique_line, file_path, entry)

	if not ok then
		vim.notify(added_or_err, vim.log.levels.ERROR)
		return
	end

	if added_or_err then
		vim.notify('Added "' .. entry .. '" to Vale ' .. kind .. ' list', vim.log.levels.INFO)
	else
		vim.notify('Vale ' .. kind .. ' list already contains "' .. entry .. '"', vim.log.levels.INFO)
	end

	vim.notify('Restart Vale or reopen the buffer if diagnostics do not refresh immediately', vim.log.levels.INFO)
	vim.cmd('silent! edit')
end

function M.setup()
	ensure_local_vocab_files()

	vim.api.nvim_create_user_command('ValeAccept', function(opts)
		add_to_vocab('accept', opts.args)
	end, {
		nargs = '?',
		desc = 'Add a word to the Vale accept vocabulary',
	})

	vim.api.nvim_create_user_command('ValeReject', function(opts)
		add_to_vocab('reject', opts.args)
	end, {
		nargs = '?',
		desc = 'Add a word to the Vale reject vocabulary',
	})

	vim.api.nvim_create_user_command('ValeAcceptInput', function()
		vim.ui.input({ prompt = 'Vale accept word: ' }, function(input)
			if input then
				add_to_vocab('accept', input)
			end
		end)
	end, {
		desc = 'Prompt for a word to add to the Vale accept vocabulary',
	})

	vim.api.nvim_create_user_command('ValeRejectInput', function()
		vim.ui.input({ prompt = 'Vale reject word: ' }, function(input)
			if input then
				add_to_vocab('reject', input)
			end
		end)
	end, {
		desc = 'Prompt for a word to add to the Vale reject vocabulary',
	})
end

return M