return function(splitWorkspaces)
	local mainMod = "SUPER"

	for i = 1, 5 do
		local n = tostring(i)
		if splitWorkspaces then
			local workspaceIndex = i
			hl.bind(mainMod .. " + " .. n, function() return splitWorkspaces.workspace(workspaceIndex) end)
			hl.bind(mainMod .. " + SHIFT + " .. n, function() return splitWorkspaces.move_to_workspace(workspaceIndex) end)
			hl.bind(mainMod .. " + CONTROL + " .. n, function() return splitWorkspaces.move_to_workspace_silent(workspaceIndex) end)
		else
			hl.bind(mainMod .. " + " .. n, hl.dsp.focus({ workspace = n }))
			hl.bind(mainMod .. " + SHIFT + " .. n, hl.dsp.window.move({ workspace = n, follow = true }))
			hl.bind(mainMod .. " + CONTROL + " .. n, hl.dsp.window.move({ workspace = n, follow = false }))
		end
	end

	hl.bind(mainMod .. " + N", hl.dsp.focus({ monitor = "+1" }))
	hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ monitor = "+1" }))
end
