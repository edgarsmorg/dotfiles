vim.pack.add({{ src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' }})
require('catppuccin').setup({
	transparent_background = true,
  color_overrides = {
    all = {
      base = '#000000',
      mantle = '#000000',
      crust = '#000000',
    },
  },
})
