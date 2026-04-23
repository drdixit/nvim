require('config.options')
require('config.autocmds')
require('config.keymaps')

vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/j-hui/fidget.nvim' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/copilotlsp-nvim/copilot-lsp' },
  { src = 'https://github.com/zbirenbaum/copilot.lua' },
  { src = 'https://github.com/fang2hou/blink-copilot' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.10.2' },
})

require('plugins.nvim-web-devicons')
require('plugins.tokyonight')
require('plugins.gitsigns')
require('plugins.fidget')
require('plugins.fzf-lua')

require('plugins.copilot-lsp')
require('plugins.copilot')
require('plugins.blink')

vim.lsp.config('*', { root_markers = { '.git' } })
vim.lsp.enable({ 'dartls', 'lua_ls' })

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  -- Can switch between these as you prefer
  virtual_text = true,   -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines
  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}

-- Native LSP capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- vim.lsp.config('*', {
--   capabilities = capabilities
-- })

require('vim._core.ui2').enable({ enable = true })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

