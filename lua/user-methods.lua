function CopyRelPath()
  vim.fn.setreg('+', vim.fn.expand '%')
end

function CopyFullPath()
  vim.fn.setreg('+', vim.fn.expand '%:p')
end

function CopyRelLine()
  vim.fn.setreg('+', vim.fn.expand '%' .. ':' .. vim.fn.line '.')
end

function CopyFullLine()
  vim.fn.setreg('+', vim.fn.expand '%:p' .. ':' .. vim.fn.line '.')
end

-- keep <leader>a as personal customized action prefix
vim.keymap.set('n', ' cfp', CopyFullPath, { desc = '[C]opy [F]ull [P]ath)' })
vim.keymap.set('n', ' cfl', CopyFullLine, { desc = '[C]opy [F]ull [L]ine)' })
vim.keymap.set('n', ' crp', CopyRelPath, { desc = '[C]opy [R]elative [P]ath)' })
vim.keymap.set('n', ' crl', CopyRelLine, { desc = '[C]opy [R]elative [L]ine)' })
vim.keymap.set('n', ' ca', ':%yank +<CR>', { desc = '[C]opy [A]ll, then go back to positon before copy' })

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
