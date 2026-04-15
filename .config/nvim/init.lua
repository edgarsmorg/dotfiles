require("config.lsp")
require("config.options")
require("config.colorscheme")
vim.pack.add({ { src='https://github.com/stevearc/oil.nvim' } })
require('oil').setup({
  view_options = {
    show_hidden = true,
  },
  float = {
    padding = 5,
  },
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
require("plugin.telescope")
