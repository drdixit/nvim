return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        disable = { "missing-fields" },
        globals = { 'vim' },
      },
      -- hint = {
      --   enable = true,          -- Turns inlay hints ON
      --   setType = false,        -- Don't show variable type hints when assigning a value
      --   paramType = true,       -- Show function parameter type hints
      --   paramName = "Disable",  -- Don't show parameter name hints at call sites
      --   semicolon = "Disable",  -- Don't hint semicolons (Lua doesn’t really use them)
      --   arrayIndex = "Disable", -- Don't show array index hints (like [0], [1])
      -- },
    }
  }
}

-- Example and explanations
--
-- vim.lsp.protocol.MessageType is an enum for LSP message severity:
-- Error = 1
-- Warning = 2
-- Info = 3
-- Log = 4
-- log_level = vim.lsp.protocol.MessageType.Warning
-- you tell Neovim to filter out Info and Log messages, so you only see warnings and errors in the LSP log.
-- If you want all messages, you’d use:
-- log_level = vim.lsp.protocol.MessageType.Log
-- If you want only errors:
-- log_level = vim.lsp.protocol.MessageType.Error
--
-- there is also priority in root_markers
-- root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' }
-- First priority: A folder containing either .luarc.json or .luarc.jsonc (the nested { ... } means these two are equal priority).
-- Fallback: A folder containing .git (common fallback for git-based projects).
