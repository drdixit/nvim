require("fzf-lua").setup({ 'telescope' })

vim.keymap.set('n', '<leader>sf', FzfLua.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader><leader>', FzfLua.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sg', FzfLua.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sk', FzfLua.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sd', FzfLua.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
