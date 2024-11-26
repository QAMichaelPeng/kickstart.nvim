return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    server = {
      default_settings = {
        ['rust-analyzer'] = {
          cargo = {
            features = 'all',
          },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
