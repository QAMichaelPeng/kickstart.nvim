return {
  {
    'zbirenbaum/copilot.lua',
    enabled = vim.g.have_github_copilot,
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
