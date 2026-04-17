require('config.options')
require('config.autocmds')
require('config.keymaps')

vim.pack.add({
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
})

require('plugins.tokyonight')
require('plugins.gitsigns')

-- vim.pack.add({
--     -- Install "plugin1" and use default branch (usually `main` or `master`)
--     'https://github.com/user/plugin1',
--
--     -- Same as above, but using a table (allows setting other options)
--     { src = 'https://github.com/user/plugin1' },
--
--     -- Specify plugin's name (here the plugin will be called "plugin2"
--         -- instead of "generic-name")
--     { src = 'https://github.com/user/generic-name', name = 'plugin2' },
--
--     -- Specify version to follow during install and update
--     {
--     src = 'https://github.com/user/plugin3',
--     -- Version constraint, see |vim.version.range()|
--     version = vim.version.range('1.0'),
--     },
--     {
--     src = 'https://github.com/user/plugin4',
--     -- Git branch, tag, or commit hash
--     version = 'main',
--     },
-- })
