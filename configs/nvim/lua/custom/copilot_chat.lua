local M = {}

local uv = vim.uv or vim.loop

local function get_relative_time(timestamp)
  local delta = math.max(0, os.time() - timestamp)

  if delta < 60 then
    return 'just now'
  end

  if delta < 3600 then
    return string.format('%dm ago', math.floor(delta / 60))
  end

  if delta < 86400 then
    return string.format('%dh ago', math.floor(delta / 3600))
  end

  if delta < 604800 then
    return string.format('%dd ago', math.floor(delta / 86400))
  end

  return string.format('%dw ago', math.floor(delta / 604800))
end

local function get_sessions()
  local chat = require 'CopilotChat'
  local history_path = chat.config.history_path
  local history_files = vim.fn.glob(history_path .. '/*.json', false, true)
  local sessions = {}

  for _, file in ipairs(history_files) do
    local stat = uv.fs_stat(file)
    if stat then
      table.insert(sessions, {
        name = vim.fn.fnamemodify(file, ':t:r'),
        path = file,
        mtime = stat.mtime.sec,
      })
    end
  end

  table.sort(sessions, function(left, right)
    if left.mtime == right.mtime then
      return left.name < right.name
    end

    return left.mtime > right.mtime
  end)

  return chat, sessions
end

local function format_session(session)
  return string.format('%s  (%s)', session.name, get_relative_time(session.mtime))
end

function M.save_picker()
  vim.ui.input({ prompt = 'Save Copilot chat as: ' }, function(input)
    if not input or vim.trim(input) == '' then
      return
    end

    require('CopilotChat').save(vim.trim(input))
  end)
end

function M.load_picker()
  local chat, sessions = get_sessions()

  if #sessions == 0 then
    vim.notify('No Copilot chat history found', vim.log.levels.INFO)
    return
  end

  vim.ui.select(sessions, {
    prompt = 'Load Copilot chat:',
    format_item = format_session,
  }, function(choice)
    if not choice then
      return
    end

    chat.load(choice.name)
  end)
end

function M.delete_picker()
  local _, sessions = get_sessions()

  if #sessions == 0 then
    vim.notify('No Copilot chat history found', vim.log.levels.INFO)
    return
  end

  vim.ui.select(sessions, {
    prompt = 'Delete Copilot chat:',
    format_item = format_session,
  }, function(choice)
    if not choice then
      return
    end

    vim.ui.select({ 'No', 'Yes' }, {
      prompt = string.format('Delete Copilot chat "%s"?', choice.name),
    }, function(confirm)
      if confirm ~= 'Yes' then
        return
      end

      local ok, err = os.remove(choice.path)
      if not ok then
        vim.notify('Failed to delete Copilot chat: ' .. (err or choice.name), vim.log.levels.ERROR)
        return
      end

      vim.notify('Deleted Copilot chat: ' .. choice.name, vim.log.levels.INFO)
    end)
  end)
end

return M