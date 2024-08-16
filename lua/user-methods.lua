vim.api.nvim_create_user_command('CopyRelPath', function()
  vim.fn.setreg('+', vim.fn.expand '%')
end, {})

vim.api.nvim_create_user_command('CopyAbsPath', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
end, {})

vim.api.nvim_create_user_command('CopyRelLine', function()
  vim.fn.setreg('+', vim.fn.expand '%' .. ':' .. vim.fn.line '.')
end, {})

vim.api.nvim_create_user_command('CopyAbsLine', function()
  vim.fn.setreg('+', vim.fn.expand '%:p' .. ':' .. vim.fn.line '.')
end, {})

-- Function that accepts keywords and returns a closure
function createBufferFilterFunction(keywords)
  -- Closure that does the actual filtering
  return function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local filtered_lines = {}

    -- Filter lines containing any of the keywords
    for _, line in ipairs(lines) do
      for _, keyword in ipairs(keywords) do
        local keyword_lower = keyword:lower()
        local line_lower = line:lower()
        if line_lower:find(keyword_lower, 1, true) then
          table.insert(filtered_lines, line)
          break -- Stop checking other keywords once a match is found
        end
      end
    end

    -- Create a new buffer for the filtered lines if any matches were found
    if #filtered_lines > 0 then
      local buf = vim.api.nvim_create_buf(false, true) -- Create a new scratch buffer
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, filtered_lines)
      vim.api.nvim_set_current_buf(buf) -- Display the new buffer
    else
      print 'No lines matched the specified keywords.'
    end
  end
end

-- Example of creating and using the filter function
local filterFunction = createBufferFilterFunction { 'error', 'warn', 'critical' }
vim.api.nvim_create_user_command('FilterImportant', filterFunction, { desc = 'Filter buffer lines by important keywords' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
