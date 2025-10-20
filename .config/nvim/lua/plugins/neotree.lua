return {
	"nvim-neo-tree/neo-tree.nvim",
	checkout = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--"nvim-tree/nvim-web-devicons",
		"DaikyXendo/nvim-material-icon",
	},
	lazy = false,
	keys = {
		{ "\\", "<cmd>Neotree filesystem reveal float<cr>", desc = "Neo-tree reveal", silent = true },
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
