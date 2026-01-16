vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('1.0'),
  },
})

require('blink.cmp').setup({
  keymap = { 
    preset = 'default',
    ["<C-d>"] = { "scroll_documentation_down" },
    ["<C-u>"] = { "scroll_documentation_up" },
  },
  appearance = { nerd_font_variant = 'normal' },
  signature = { enabled = true },
  completion = {
    menu = { border = "rounded" },
    documentation = { auto_show = true, window = { border = "rounded" } },
  },
  sources = { default = { 'lsp', 'path', 'buffer' }, },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
