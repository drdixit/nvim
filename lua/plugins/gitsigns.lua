require('gitsigns').setup({
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
  local branch = vim.b.gitsigns_head or ""
  if branch ~= "" then branch = "[" .. branch .. "]" end

  local changes = vim.b.gitsigns_status or ""

  local commit = last_commit_cache ~= "" and "[" .. last_commit_cache .. "]" or ""

  local left  = " %f " .. changes
  local right = branch .. " " .. commit .. " "
  return left .. "%=" .. right
end

vim.o.statusline = "%!v:lua.Statusline()"
