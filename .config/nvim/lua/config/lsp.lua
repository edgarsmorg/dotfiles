vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	-- Stay on the stable v1 line instead of following main/v2.
	{ src = "https://github.com/saghen/blink.cmp", version = "1.10.2" },
}

local servers = {
  require('servers.csslps'),
  require('servers.lua_ls'),
  require('servers.ruby_lsp'),
  require('servers.sorbet'),
}

require('mason').setup({})
require('mason-lspconfig').setup({})

local tools = {}
for _, s in ipairs(servers) do
  if s.install then tools[#tools+1] = s.install end
end
require('mason-tool-installer').setup({ ensure_installed = tools})

for _, s in ipairs(servers) do
  vim.lsp.config(s.name, s.config)
  vim.lsp.enable(s.name)
end

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
  snippets = { preset = "luasnip" },
  fuzzy = {
    implementation = "prefer_rust",
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
        columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
      },
    },
  },
})
