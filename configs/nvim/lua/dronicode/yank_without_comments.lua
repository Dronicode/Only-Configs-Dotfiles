local M = {}

-- Debug setup ---------------------------------------------------------------------------------------------------------
-- Public debug toggle and setter
M.debug = true
function M.set_debug(v) M.debug = not not v end

-- Treesitter setup ----------------------------------------------------------------------------------------------------
-- Map filetypes or parser names that should use a different Tree-sitter parser.
-- Example: 'zsh' buffers should use the 'bash' parser.
local filetype_map = {
	zsh = "bash",
}

-- Helper: detect_language tries nvim-treesitter's mapping first, then a small
-- manual map for filetypes known to differ from parser names (e.g. zsh -> bash).
local function detect_language(old_buffer)
	local ok, parsers = pcall(require, "nvim-treesitter.parsers")

	-- If parsers module is available, prefer the parser-detected language.
	if ok and parsers then
		local detected = parsers.get_buf_lang(old_buffer)
		if detected and detected ~= "" then
			-- if a parser is installed for the detected name, use it
			if parsers.has_parser(detected) then
				return detected, nil
			end
			-- otherwise, check whether a mapped parser exists (e.g. zsh -> bash)
			local mapped = filetype_map[detected]
			if mapped and parsers.has_parser(mapped) then
				return mapped, nil
			end
			-- fall through to try filetype mapping below
		end
	end

	-- If treesitter didn't yield a usable parser, consult the filetype map
	local ft = vim.api.nvim_buf_get_option(old_buffer, "filetype")
	if not ft or ft == "" then
		return nil, "Cannot detect filetype for Tree-sitter parsing"
	end
	local mapped = filetype_map[ft]
	if mapped then
		return mapped, nil
	end
	return nil, "No mapping for filetype: " .. ft
end

-- Helper: ensure the Tree-sitter parser for `lang` is installed
local function ensure_parser(lang)
	local ok, parsers = pcall(require, "nvim-treesitter.parsers")
	if not ok or not parsers then
		return nil, "nvim-treesitter.parsers not available"
	end
	if not parsers.has_parser(lang) then
		return nil, "No Tree-sitter parser installed for: " .. lang
	end
	return true, nil
end

-- Main Code -----------------------------------------------------------------------------------------------------------

-- Helper: is the line blank or only whitespace?
local function is_blank_line(line)
	return line:match('^%s*$') ~= nil
end

-- Helper: detect whether a line contains a comment using Tree-sitter.
-- Returns boolean has_comment and optionally the comment node text (string) if found.
local function detect_comments(parser, line)


end

-- Strip comment string from the original line. Remove the first occurrence
-- of the comment text in the line (exact substring match) and return the new line.
local function strip_comments(original_line, comment_text)
	if not comment_text or comment_text == '' then return original_line end
	-- Find the first exact substring match and remove it. Be literal.
	local s, e = original_line:find(vim.pesc(comment_text), 1, true)
	if not s then
		return original_line
	end
	local before = original_line:sub(1, s - 1)
	local after = original_line:sub(e + 1)
	return before .. after
end

-- Cleanup: strip trailing whitespace only
local function cleanup_line(line)
	return (line:match('^(.-)%s*$') or '')
end

-- Debug logging function. Accepts old_line, new_line, has_comment.
local function debug_log(old_line, new_line, has_comment, line_number, dest_buf)
	if not M.debug then return end
	local prefix = string.format('line %d', line_number)
	local lines = {
		string.format('%s COMMENT:\t%s', prefix, tostring(not not has_comment)),
		string.format('%s OLD:\t%s', prefix, old_line),
		string.format('%s NEW:\t%s', prefix, new_line),
	}
	-- Append to destination buffer
	local cur = vim.api.nvim_buf_line_count(dest_buf)
	if cur == 0 then
		vim.api.nvim_buf_set_lines(dest_buf, 0, -1, false, lines)
	else
		vim.api.nvim_buf_set_lines(dest_buf, -1, -1, false, lines)
	end
	-- append cleaned line and blank separator
	vim.api.nvim_buf_set_lines(dest_buf, -1, -1, false, { new_line, '' })
end

-- Append a cleaned line to destination buffer (no debug)
local function add_to_buffer(dest_buf, line)
	local cur = vim.api.nvim_buf_line_count(dest_buf)
	if cur == 0 then
		vim.api.nvim_buf_set_lines(dest_buf, 0, -1, false, { line })
	else
		vim.api.nvim_buf_set_lines(dest_buf, -1, -1, false, { line })
	end
end

-- Step through code and apply the processing steps described.
-- Returns the destination buffer number.
function M.yank_without_comments()
	local old_buffer = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(old_buffer, 0, -1, false)

	-- get parser from detect_language here

	local new_buffer = vim.api.nvim_create_buf(true, false)
	vim.api.nvim_set_current_buf(new_buffer)
	vim.api.nvim_buf_set_option(new_buffer, 'modifiable', true)

	for i, line in ipairs(lines) do
		if is_blank_line(line) then
			-- skip
		else
			local has_comment, comment_text = detect_comments(parser, line)
			local new_line = line
			if has_comment then
				new_line = strip_comments(new_line, comment_text)
			end
			new_line = cleanup_line(new_line)
			if M.debug then
				debug_log(line, new_line, has_comment, i, new_buffer)
			else
				add_to_buffer(new_buffer, new_line)
			end
		end
	end

	vim.api.nvim_buf_set_option(new_buffer, 'modifiable', false)
	return new_buffer
end

return M

