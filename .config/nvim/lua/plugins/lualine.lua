vim.pack.add {
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' }
}

require('lualine').setup({
	themes = 'iceberg_dark',
	sections = {
		lualine_x = {'lsp_status', 'filetype'}
	}
})
