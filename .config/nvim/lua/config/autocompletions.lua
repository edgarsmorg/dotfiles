vim.pack.add{
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/Saghen/blink.cmp', version = 'v1.10.2' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
}

require('blink.cmp').setup({
  keymap = { preset = 'default' },

  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = 'mono',
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    per_filetype = {
      oil = {},
    },
  },

  snippets = {
    preset = 'luasnip',
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = { enabled = true },
    menu = {
      draw = {
        treesitter = { 'lsp' },
      },
    },
  },

  signature = { enabled = true },
})
