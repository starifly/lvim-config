local M = {}

M.escape_rg_text = function(text)
  text = text:gsub('%(', '\\%(')
  text = text:gsub('%)', '\\%)')
  text = text:gsub('%[', '\\%[')
  text = text:gsub('%]', '\\%]')
  text = text:gsub('%{', '\\%{')
  text = text:gsub('%}', '\\%}')
  text = text:gsub('"', '\\"')
  text = text:gsub('-', '\\-')
  text = text:gsub('+', '\\-')

  return text
end

M.live_grep_raw = function(opts, mode)
  opts = opts or {}
  opts.prompt_title = 'Live Grep Raw (-t[ty] include, -T exclude -g"[!] [glob])"'
  -- if not opts.default_text then
  --   if mode then
  --     opts.default_text = '"' .. M.escape_rg_text(M.get_text(mode)) .. '"'
  --   else
  --     opts.default_text = '"'
  --   end
  -- end
  if mode then
    opts.default_text = opts.default_text .. '"' .. M.escape_rg_text(M.get_text(mode)) .. '"'
  end

  require('telescope').extensions.live_grep_args.live_grep_args(
  -- require('telescope.themes').get_ivy(opts)
  -- require('telescope.themes').get_cursor(opts)
    require('telescope.themes').get_dropdown(opts)
  )
end

M.get_text = function(mode)
  local current_line = vim.api.nvim_get_current_line()
  local start_pos = {}
  local end_pos = {}
  if mode == 'v' then
    start_pos = vim.api.nvim_buf_get_mark(0, "<")
    end_pos = vim.api.nvim_buf_get_mark(0, ">")
  elseif mode == 'n' then
    start_pos = vim.api.nvim_buf_get_mark(0, "[")
    end_pos = vim.api.nvim_buf_get_mark(0, "]")
  end

  return string.sub(current_line, start_pos[2] + 1, end_pos[2])
end

M.get_buf_fullpath = function()
  -- print(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
  return vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
end

M.GetBufRelativePath = function()
  local path = string.gsub(M.get_buf_fullpath(), vim.fn.getcwd(), "")
  -- Remove leading backslash if it exists
  if string.sub(path, 1, 1) == "/" then
    path = string.sub(path, 2)
  end
  -- print(path)
  return path
end

return M
