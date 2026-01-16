vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    dart = { "dart_format" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "[F]ormat file or range (in visual mode)" })
