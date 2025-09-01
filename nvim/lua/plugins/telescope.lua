return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {"<leader>fg", ":Telescope live_grep prompt_prefix=🔍<cr>", desc = ""},
      {"<C-p>", ":Telescope find_files prompt_prefix=🔍 hidden=true<cr>", desc = ""},
      {"<C-b>", ":Telescope buffers<cr>", desc = ""}
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown{
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
