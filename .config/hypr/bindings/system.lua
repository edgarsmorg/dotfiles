local mainMod = "SUPER"

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("pidof hyprlock >/dev/null || hyprlock"), { description = "Lock session" })

hl.bind("CONTROL + ALT + DELETE", hl.dsp.exec_cmd("hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill qs && qs"))
hl.bind(mainMod .. " + CONTROL + B", hl.dsp.exec_cmd("pkill swaync; swaync"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpaper && hyprpaper"))
hl.bind(mainMod .. " + CONTROL + M", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/update-colors.sh"))
