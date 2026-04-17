require('gitsigns').setup({
})
vim.o.statusline = "%f %m %=%{get(b:,'gitsigns_status','')} %l:%c"
