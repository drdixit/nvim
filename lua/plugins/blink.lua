require('blink.cmp').setup({
  keymap = {
    preset = 'super-tab',
    ['<C-d>'] = { 'scroll_documentation_down' },
    ['<C-u>'] = { 'scroll_documentation_up' },
    ["<Tab>"] = {
      function(cmp)
        if vim.b[vim.api.nvim_get_current_buf()].nes_state then
          cmp.hide()
          return (
            require("copilot-lsp.nes").apply_pending_nes()
            and require("copilot-lsp.nes").walk_cursor_end_edit()
          )
        end
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
  },
  appearance = { nerd_font_variant = 'normal' },
  signature = { enabled = true },
  completion = {
    menu = { border = 'rounded' },
    documentation = { auto_show = true, window = { border = 'rounded' } },
  },
  sources = {
    default = { 'lsp', 'path', 'buffer', 'copilot' },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
        opts = {
          debounce = 200,
          max_completions = 5,
        },
      },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
