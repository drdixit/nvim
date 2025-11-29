vim.g.loaded_perl_provider = 0 -- disable perl support
vim.g.loaded_ruby_provider = 0 -- disable ruby support
vim.g.loaded_python3_provider = 0 -- disable python3 support
vim.g.have_nerd_font = true -- enable nerd font support
vim.g.mapleader = " " -- sets global leader key
vim.g.maplocalleader = " " -- sets local leader key
vim.opt.compatible = false -- turn off vi compatibility mode
vim.opt.fileencoding = "utf-8" -- encoding set to utf-8
vim.opt.termguicolors = true -- enable true colors in the terminal
vim.opt.background = "dark" -- use dark background
vim.cmd("colorscheme retrobox") -- set colorscheme
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3c3836" })
vim.opt.mouse = "" -- disable mouse support
vim.opt.guicursor = "" -- block cursor in all modes
vim.opt.number = true -- turn on line numbers
vim.opt.relativenumber = true -- turn on relative line numbers
vim.opt.wrap = false -- disable line wrapping
vim.opt.scrolloff = 10 -- keep 10 lines visible above/below cursor
vim.opt.sidescrolloff = 10 -- keep 5 columns visible left/right of cursor during horizontal scroll
vim.opt.pumheight = 10 -- max number of items to show in popup menu
vim.opt.title = true -- show title
-- vim.opt.showtabline = 2 -- always show the tab line
vim.opt.laststatus = 2 -- always show the statusline
vim.opt.showcmd = true -- show (partial) command in the last line of the screen
vim.opt.cmdheight = 2 -- height of the command line (number of lines)
vim.opt.showmode = true -- show current mode in command line
vim.opt.signcolumn = "yes:2" -- always show 2 sign columns
vim.opt.colorcolumn = "80" -- show column at 80 chars
vim.opt.updatetime = 200 -- faster update time for cursorhold events
vim.opt.timeoutlen = 300 -- timeout for mapped sequences (ms)
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_altv = 1 -- change from left splitting to right splitting
vim.g.netrw_liststyle = 3 -- tree style view in netrw
vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitbelow = true -- horizontal splits open below
vim.opt.splitkeep = "screen" -- keep text stable when splitting
vim.opt.backspace = "indent,eol,start" -- make backspace work in insert mode
vim.opt.virtualedit = "block" -- allow cursor anywhere in visual block mode
vim.opt.inccommand = "split" -- show live preview of :substitute in a split
vim.opt.confirm = true -- ask for confirmation instead of errors
vim.opt.incsearch = true -- show search matches as you type
vim.opt.ignorecase = true -- ignore case in search by default
vim.opt.smartcase = true -- override ignorecase if search has capitals
vim.opt.swapfile = false -- disable swap file
vim.opt.backup = false -- disable backup file
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir" -- undo directory path

-- Indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- indent width for << and >>
vim.opt.tabstop = 4 -- display width of a tab character
vim.opt.softtabstop = 4 -- tab key inserts 4 spaces
vim.opt.list = true -- show whitespace characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- characters for tabs, trailing spaces, NBSP

-- Indent behavior (we are disabling some things because of treesitter indentation)
vim.opt.autoindent = true -- copy indent from current line on new line
vim.opt.smartindent = false -- disable smart indent
vim.opt.cindent = false -- disable C-style indent
-- vim.cmd("filetype indent off")           -- old way to disable filetype indent
-- vim.opt.filetype.indent = "off"             -- disable filetype-based indent
-- vim.opt.filetype = "on"                     -- enable filetype detection
vim.cmd("filetype indent off")
vim.cmd("filetype on")

-- 2 spaces languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "html",
    "css",
    "bash",
    "toml",
    "xml",
    "ini",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.opt.completeopt = { "menuone", "noselect" } -- always show completion menu, but don"t auto-select items

-- highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Keymaps

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlight with esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page and keep cursor in middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page and keep cursor in middle" })

vim.keymap.set("n", "<leader>e", ":25Lexplor<CR>", { desc = "Open Netrw in 25% vertical split (tree view)" })

vim.pack.add({
  { src="https://github.com/nvim-treesitter/nvim-treesitter", version="master" },
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" })

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "php",
    "bash",
    "c",
    "diff",
    "html",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
    "dart",
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },

  incremental_selection = {

    enable = true,
    keymaps = {

      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },

  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = {
          query = "@local.scope",
          query_group = "locals",

          desc = "Select language scope",
        },
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
})

vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
      vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
        vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
      end

    end
  end,
})
