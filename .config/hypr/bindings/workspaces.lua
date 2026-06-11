hl.config({
	plugin = {
		split_monitor_workspaces = {
			count = 5,
			keep_focused = 0,
			enable_notifications = 0,
			enable_persistent_workspaces = 1,
			link_monitors = 0,
		},
	},
})

local mainMod = "SUPER"
local smw = hl.plugin.split_monitor_workspaces
smw.monitor_priority({ "DP-1", "DP-2" })

for i = 1, 5 do
	local n = tostring(i)
	hl.bind(mainMod .. " + " .. n,         function() smw.workspace(n) end)
	hl.bind(mainMod .. " + SHIFT + " .. n, function() smw.move_to_workspace(n) end)
	hl.bind(mainMod .. " + CONTROL + " .. n,  function() smw.move_to_workspace_silent(n) end)
end

hl.bind(mainMod .. " + N", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + N", function() smw.change_monitor("next") end)
hl.bind(mainMod .. " + SHIFT + R", function() smw.grab_rogue_windows() end)
