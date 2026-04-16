vim.pack.add({{ src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' }})
require('catppuccin').setup({
  color_overrides = {
    all = {
      base = '#000000',
      mantle = '#000000',
      crust = '#000000',
    },
  },
})
