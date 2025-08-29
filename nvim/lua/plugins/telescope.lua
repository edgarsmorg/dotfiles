return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {"<leader>fg", ":Telescope live_grep<cr>", desc = ""},
    {"<C-p>", ":Telescope find_files<cr>", desc = ""},
    {"<C-b>", ":Telescope buffers<cr>", desc = ""}
  }
}
