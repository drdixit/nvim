vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme base16-black-metal-gorgoroth")
--vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
--vim.api.nvim_set_hl(0, "normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "nontext", { bg = "none" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.updatetime = 50
vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

--vim.opt.smarttab = true
--vim.opt.smartindent = true
--vim.opt.autoindent = true -- Keep identation from previous line

-- Enable break indent
vim.opt.breakindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.backspace = "indent,eol,start"
vim.opt.virtualedit = "block"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

vim.g.have_nerd_font = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won"t work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
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

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -------------------
        -- PLUGINS START --
        -------------------
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            main = "nvim-treesitter.configs",
            opts = {
                ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
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
                }
            }
        },
        {
            "tpope/vim-sleuth"
            -- No further initialization needed, as this is a real "vim" not a lua
            -- plugin.
        },
        {
            -- This code tricks plugins into thinking nvim-web-devicons is installed while silently
            -- substituting it with mini.icons using Lua’s package.preload override system
            "echasnovski/mini.icons",
            opts = {},
            version = false,
            lazy = true,
            specs = {
                { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
            },
            init = function()
                package.preload["nvim-web-devicons"] = function()
                    require("mini.icons").mock_nvim_web_devicons()
                    return package.loaded["nvim-web-devicons"]
                end
            end,
        },
        {
            "stevearc/oil.nvim",
            ---@module "oil"
            ---@type oil.SetupOpts
            opts = {
                view_options = { show_hidden = true, is_tree = true },
                columns = { "icon", "permissions", "size" },
            },
            -- Optional dependencies
            dependencies = { "echasnovski/mini.icons" },
            -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
            -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
            lazy = false,
        }
        -----------------
        -- PLUGINS END --
        -----------------
    },
    install = { colorscheme = { "base16-black-metal-gorgoroth" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>", {desc="Open Current Directory in Oil"})
