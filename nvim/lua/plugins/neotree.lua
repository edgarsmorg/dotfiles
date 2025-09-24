return {
  "nvim-neo-tree/neo-tree.nvim",
  checkout = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --"nvim-tree/nvim-web-devicons",
    'DaikyXendo/nvim-material-icon',
  },
  lazy=false,
  keys = {
    {"<C-n>",":Neotree filesystem reveal float toggle=true<cr>",desc = "Neo-tree"}
  }
}
