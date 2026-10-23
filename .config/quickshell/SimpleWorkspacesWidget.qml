import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

RowLayout {
	id: root
	required property HyprlandMonitor monitor

	Repeater {
		model: Hyprland.workspaces.values.filter(w => w.id > 0 && w.monitor === root.monitor)
		Text{
			required property var modelData
			readonly property bool isActive: modelData.active
			readonly property bool occupied: modelData.toplevels.values.length > 0
			padding: 3
			text: occupied ? "󰝥" : ""
			color: isActive? Theme.workspaceActive : (occupied ? Theme.workspaceOccupied : Theme.workspaceIdle)
			font { 
				family: "IosevkaTerm Nerd Font Mono"
				pixelSize: 20
			}
		}
	}
}
