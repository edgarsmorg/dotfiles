return {
  name = 'sorbet',
  config = {
    cmd = { 'bundle', 'exec', 'srb', 'tc', '--lsp' },
    filetypes = { 'ruby', 'eruby' },
    root_markers = { 'Gemfile', '.ruby-version', '.ruby-gemset', 'Rakefile', '.git' },
    settings = {
      sorbet = {
        enabled = true,
      },
    },
  },
}
