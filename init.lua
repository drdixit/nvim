require("options")

-- below is quite slow but i guess it's okay
vim.g.clipboard = {
  name = 'win32yank',
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}
-- vim.opt.clipboard:append('unnamedplus')

vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons.git" })
require("plugins.tokyonight")
require("plugins.treesitter")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.blink")

vim.lsp.config('*', { root_markers = { '.git' } })
vim.lsp.enable('dartls')
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
--       vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--       vim.keymap.set('i', '<C-Space>', function()
--         vim.lsp.completion.get()
--       end)
--     end
--   end,
-- })
--
vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
  virtual_text = {
    source = true,
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})
-- Add to init.lua (after diagnostic.config)
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Diagnostic float' })

require("plugins.conform")
