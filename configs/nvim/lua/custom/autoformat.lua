local M = {}

local function is_obsidian_template_markdown(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)

  if path == '' then
    return false
  end

  local normalized = path:gsub('\\', '/'):lower()

  return normalized:match('/obsidian/.-/templates?/') ~= nil
    or normalized:match('/obsidian/.-/[^/]*templates?[^/]*/') ~= nil
end

function M.format_current_buffer()
  local bufnr = vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].filetype == 'markdown' and is_obsidian_template_markdown(bufnr) then
    vim.notify('Skipping Prettier for Obsidian template markdown', vim.log.levels.INFO)
    return
  end

  require('conform').format { async = true, lsp_format = 'fallback' }
end

function M.format_on_save(bufnr)
  local disable_filetypes = { c = true, cpp = true }
  if disable_filetypes[vim.bo[bufnr].filetype] then
    return nil
  end

  if vim.bo[bufnr].filetype == 'markdown' and is_obsidian_template_markdown(bufnr) then
    return nil
  end

  return {
    timeout_ms = 500,
    lsp_format = 'fallback',
  }
end

return M