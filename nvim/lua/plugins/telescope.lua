return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {"<leader>fg", ":Telescope live_grep prompt_prefix=🔍<cr>", desc = ""},
    {"<C-p>", ":Telescope find_files prompt_prefix=🔍 hidden=true<cr>", desc = ""},
    {"<C-b>", ":Telescope buffers<cr>", desc = ""}
  },
  opts = {
    defaults = {
      mappings = {
         i = {
           ["<cr>"] = require("telescope.actions").select_default,
         },
      },
    },
  },
}
