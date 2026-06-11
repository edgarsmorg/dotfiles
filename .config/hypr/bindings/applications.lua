return function (apps)
	local mainMod = "SUPER"

	hl.bind(mainMod .. " + Q", hl.dsp.window.close())
	hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(apps.terminal))
	hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(apps.browser))
	hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(apps.fileManager))
	hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(apps.menu))
	hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
end
