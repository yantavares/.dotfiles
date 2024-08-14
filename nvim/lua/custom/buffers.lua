-- Table to keep track of buffer history
local buffer_history = {}

-- Function to update the buffer history
_G.update_buffer_history = function ()
  local current_buf = vim.api.nvim_get_current_buf()
  -- Remove the current buffer if it exists in the history
  for i, buf in ipairs(buffer_history) do
    if buf == current_buf then
      table.remove(buffer_history, i)
      break
    end
  end
  -- Add the current buffer to the front of the history
  table.insert(buffer_history, 1, current_buf)
  -- Keep only the last 2 items in history
  if #buffer_history > 2 then
    table.remove(buffer_history, 3)
  end
end

-- Function to toggle between the last two file buffers
_G.toggle_buffers = function()
  if #buffer_history < 2 then
    print("No other buffer to switch to")
    return
  end
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(buffer_history) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
      vim.api.nvim_set_current_buf(buf)
      return
    end
  end
end

-- Autocommand to update buffer history on buffer switch
vim.cmd([[
  augroup BufferSwitch
    autocmd!
    autocmd BufEnter * lua update_buffer_history()
  augroup END
]])

-- Map the toggle function to a key, e.g., <leader><tab>
vim.api.nvim_set_keymap('n', '<leader><tab>', ':lua toggle_buffers()<CR>', { noremap = true, silent = true })


