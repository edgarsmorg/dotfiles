import Quickshell
import Quickshell.Hyprland
import QtQuick

Text {
	text: Hyprland.activeToplevel?.title ?? "Win+D pa abrir alguna wea"
}
