return {
  name = 'ruby_lsp',
  config = {
    cmd = { 'bundle', 'exec', 'ruby-lsp' },
    filetypes = { 'ruby', 'eruby' },
    root_markers = { 'Gemfile', '.ruby-version', '.ruby-gemset', 'Rakefile', '.git' },
    single_file_support = false,
    settings = {
      rubyLsp = {
        rubyVersionManager = 'rbenv',
      },
    },
		init_options = {
			formatter = 'standard',
			linters = { 'standard' },
			addonSettings = {
				["Ruby LSP Rails"] = {
					enablePendingMigrationsPrompt = true
				}
			}
		},
  },
}
