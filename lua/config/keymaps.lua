-- override by copilot esc key
-- vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlight with esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page and keep cursor in middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page and keep cursor in middle" })
