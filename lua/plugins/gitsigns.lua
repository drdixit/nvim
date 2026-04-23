require('gitsigns').setup({
  -- sign_priority = 11,  -- higher than LSP's 10, stays on column 1
 --  signs = {
 --    add = { text = '+' },
 --    change = { text = '~' },
 --    delete = { text = '_' },
 --    topdelete = { text = '‾' },
 --    changedelete = { text = '~' },
 -- },
})

local last_commit_cache = ""

local function update_commit()
  local result = vim.fn.system("git log -1 --format='%h %s' 2>/dev/null")
  if vim.v.shell_error == 0 then
    local trimmed = vim.trim(result)
    last_commit_cache = #trimmed > 50 and trimmed:sub(1, 47) .. "..." or trimmed
  else
    last_commit_cache = ""
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  callback = update_commit,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "GitSignsUpdate",
  callback = function()
    vim.cmd("redrawstatus")
  end,
})

function _G.Statusline()
  local changes = vim.b.gitsigns_status or ""
  return " %f " .. changes
end

vim.o.statusline = "%!v:lua.Statusline()"
