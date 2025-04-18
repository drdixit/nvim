vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
--vim.g.python3_host_prog = "C:\\Users\\mail\\scoop\\apps\\python\\current\\python.exe"

if vim.g.vscode then
  ------------------
  ---VSCode Neovim--
  ------------------
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- remap leader key
  keymap("n", "<Space>", "", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- better indent handling
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

  -- move text up and down
  keymap("v", "J", ":m .+1<CR>==", opts)
  keymap("v", "K", ":m .-2<CR>==", opts)
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

  -- removes highlighting after escaping vim search
  keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

  -- call vscode commands from neovim

  -- general keymaps
  keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
  keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
  keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
  keymap({"n", "v"}, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
  keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
  keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
  keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
  keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
  keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
  keymap({"n", "v"}, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

  -- harpoon keymaps
  keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
  keymap({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
  keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
  keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
  keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
  keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
  keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
  keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
  keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
  keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
  keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
  keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

  -----------------------
  -- VSCode Neovim End --
  -----------------------

else
  --------------------
  -- Default Neovim --
  --------------------
  -- leader key
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  --basic options
  vim.opt.updatetime = 50
  vim.opt.guicursor = ""
  vim.opt.wrap = false
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.scrolloff = 8
  vim.opt.cursorline = true
  vim.opt.signcolumn = "yes"
  vim.opt.colorcolumn = "80"
  vim.opt.swapfile = false
  vim.opt.backup = false
  vim.opt.undofile = true
  vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
  vim.opt.autoindent = true
  vim.opt.incsearch = true
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.termguicolors = true
  vim.opt.background = "dark"
  vim.opt.backspace = "indent,eol,start"
  vim.opt.clipboard:append("unnamedplus")
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.virtualedit = "block"
  vim.cmd("syntax on")
  --vim.api.nvim_set_hl(0, "normal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "nontext", { bg = "none" })
  vim.cmd("colorscheme base16-black-metal-gorgoroth")

  -- basic keymaps
  vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
  vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
  vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
  vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
  vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
  vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
  vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
  vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
  vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
  vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
  vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
  vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
  vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Navigate vim panes to k/up" })
  vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Navigate vim panes to j/down" })
  vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Navigate vim panes to h/left" })
  vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Navigate vim panes to l/right" })

  -- highlight when yanking (copying) text
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })

  -- set specific indentation for different file types
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "java", "c", "cpp", "php", "yaml", "json", "lua", "sh" }, -- 4 spaces languages
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.softtabstop = 4
    end,
  })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css", "bash", "toml", "xml", "ini" }, -- 2 spaces languages
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.softtabstop = 2
    end,
  })
  ------------------------
  -- Default Neovim End --
  ------------------------
end
