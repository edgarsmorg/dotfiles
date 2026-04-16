vim.pack.add{
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
}

-- Collect server names from lua/config/lsp/*.lua
local server_configs = {}
local config_dir = vim.fn.stdpath('config') .. '/lua/config/lsp'
for _, path in ipairs(vim.fn.glob(config_dir .. '/*.lua', false, true)) do
  local name = vim.fn.fnamemodify(path, ':t:r')
  server_configs[name] = require('config.lsp.' .. name)
end

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
  ensure_installed = vim.tbl_keys(server_configs),
})

local servers = vim.tbl_keys(server_configs)

for server, config in pairs(server_configs) do
  vim.lsp.config(server, config)
end

vim.lsp.enable(servers)
