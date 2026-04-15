return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	dependencies = { "fladson/vim-kitty" },
	lazy = false,
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "kitty" },
		},
	},
}
