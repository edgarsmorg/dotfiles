local mainMod = "SUPER"

hl.bind("CONTROL + ALT + DELETE", hl.dsp.exec_cmd("hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill waybar && waybar"))
hl.bind(mainMod .. " + CONTROL + B", hl.dsp.exec_cmd("pkill dunst && dunst"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpaper && hyprpaper"))
