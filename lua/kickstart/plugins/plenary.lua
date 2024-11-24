return {
  {
    'nvim-lua/plenary.nvim',
    config = function()
      vim.keymap.set('n', '<leader>t', '<Plug>PlenaryTestFile', { desc = 'Run test in current lua file' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
