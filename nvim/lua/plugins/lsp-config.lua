return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
   "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },  },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { mode="n", "K", vim.lsp.buf.hover, desc = "" },
      { mode="n", "gd", vim.lsp.buf.definition, desc = "" },
      { mode={ "n","v" }, "ga", vim.lsp.buf.code_action, desc = "" }
    },
    config = function()
      vim.lsp.config('luals', {})
      vim.lsp.enable('luals')
      vim.lsp.config('rubocop', {
        cmd = { "/home/emoralesg/.rbenv/shims/bundle", "exec", "rubocop", "--lsp"}
      })
      vim.lsp.enable('rubocop')


      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
