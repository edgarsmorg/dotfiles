vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.diagnostic.config{
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false
}
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function() vim.diagnostic.show() end,
})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-w>', '<cmd>w<CR>')
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>')
