vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', version = vim.version.range('*')},
})

require('telescope').setup({})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]ile' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch  word by [G]rep' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sd', builtin.git_status, { desc = '[S]earch files with [D]iff)'})
