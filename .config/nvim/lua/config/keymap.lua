vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard after the cursor position' })
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P', { desc = 'Paste from system clipboard before the cursor position' })

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    if client.supports_method('textDocument/codeAction') then
      vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code action' })
    end

    if client.supports_method('textDocument/implementation') then
      vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to implementation' })
    end

    if client.supports_method('textDocument/rename') then
      vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename symbol' })
    end

    if client.supports_method('textDocument/references') then
      vim.keymap.set('n', 'grr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Find references' })
    end

    if client.supports_method('textDocument/typeDefinition') then
      vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Go to type definition' })
    end

    if client.supports_method('codeLens/resolve') then
      vim.keymap.set('n', 'grx', vim.lsp.codelens.run, { buffer = bufnr, desc = 'Run codelens' })
    end
  end,
})
