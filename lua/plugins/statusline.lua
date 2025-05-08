return { 
	"echasnovski/mini.statusline",
	version = false,
	dependencies = {
		{ "echasnovski/mini.icons", version = false, enabled = true },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }
	},
	opts = { use_icons = true }
}
