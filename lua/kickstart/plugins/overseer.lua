-- Overseer for task action
-- https://github.com/stevearc/overseer.nvim
return {
  {
    'stevearc/overseer.nvim',
    opts = {},
    config = function()
      require('overseer').setup {
        -- Aliases for bundles of components. Redefine the builtins, or create your own.
        component_aliases = {
          -- Most tasks are initialized with the default components
          default = {
            { 'display_duration', detail_level = 2 },
            'on_output_summarize',
            'on_exit_set_status',
            'on_complete_notify',
            'on_complete_dispose',
            { 'on_output_quickfix', open = true },
          },
          -- Tasks from tasks.json use these components
          default_vscode = {
            'default',
            'on_result_diagnostics',
            'on_result_diagnostics_quickfix',
          },
        },
      }
      vim.keymap.set('n', '<leader>or', ':OverseerRun<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>oc', ':OverseerRunCmd<CR>', { noremap = true, silent = true })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
