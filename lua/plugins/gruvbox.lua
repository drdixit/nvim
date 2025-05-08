return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
        contrast = "hard",
        transparent_mode = true,
        overrides = {
            SignColumn = {bg = "#1d2021"}
        }
    },
    config = function(_, opts)
        require("gruvbox").setup(opts) -- apply your opts
        vim.o.background = "dark" -- or "light"
        vim.cmd("colorscheme gruvbox") -- THEN set the theme
    end,
}
