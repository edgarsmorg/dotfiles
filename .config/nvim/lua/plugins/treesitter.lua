vim.pack.add {
	{ src = 'https://github.com/fladson/vim-kitty' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
}
require('nvim-treesitter').setup {
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "kitty" },
	}
}
