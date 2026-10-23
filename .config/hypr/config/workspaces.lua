local splitWorkspaces = hl.plugin and hl.plugin.split_monitor_workspaces

if splitWorkspaces then
	hl.config({
		plugin = {
			split_monitor_workspaces = {
				count = 5,
				keep_focused = 0,
				enable_notifications = 0,
				enable_persistent_workspaces = 1,
				enable_wrapping = 1,
				link_monitors = 0,
			},
		},
	})
	splitWorkspaces.monitor_priority({ "DP-1", "DP-2" })
	return splitWorkspaces
end

-- Preserve the existing workspace layout if the hyprpm plugin is not loaded.
for i = 1, 9 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = i <= 5 and "DP-1" or "DP-2",
		persistent = true,
		default = (i == 1 or i == 6),
	})
end

return nil
