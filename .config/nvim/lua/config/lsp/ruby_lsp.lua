return {
  cmd = { 'bundle', 'exec', 'ruby-lsp' },
  root_dir = function(fname)
    return vim.fs.root(fname, { 'Gemfile', '.git' })
  end,
  init_options = {
    formatter = 'rubocop',
    linters = { 'rubocop' },
  },
}
