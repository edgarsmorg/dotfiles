import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Io


Scope {
	id: config
	property color textoColor: Theme.text
	property string fontFamily: "IosevkaTerm Nerd Font Mono"
	property int fontSize: 18
	// Altura por nombre de monitor; los que no estén listados usan 50 px.
	property var barHeights: ({
		"DP-1": 45,
		"DP-2": 40,
	})

	Variants {
		model: Quickshell.screens;

		PanelWindow {
			id: bar
			required property var modelData
			screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}
			// La altura predeterminada deja espacio para los widgets y 3 px libres arriba y abajo.
			implicitHeight: config.barHeights[screen.name] ?? 50
			color: "transparent"
			RowLayout {
				anchors.left: parent.left
				anchors.leftMargin: 3
				anchors.verticalCenter: parent.verticalCenter
				spacing: 6

				WorkspacesWidget {
					monitor: Hyprland.monitorFor(bar.screen)
					barHeight: bar.implicitHeight
				}
				MediaWidget {
					barHeight: bar.implicitHeight
					fontFamily: config.fontFamily
					fontSize: config.fontSize
				}
			}
			WindowTitleWidget {
				anchors.centerIn: parent
				barHeight: bar.implicitHeight
				textColor: config.textoColor
				fontFamily: config.fontFamily
				fontSize: config.fontSize
			}
			RowLayout {
				anchors.right: parent.right
				anchors.rightMargin: 3
				anchors.verticalCenter: parent.verticalCenter
				spacing: 6

				AudioWidget {
					barHeight: bar.implicitHeight
					fontFamily: config.fontFamily
					fontSize: config.fontSize
				}
				ClockWidget {
					barHeight: bar.implicitHeight
					textColor: Theme.text
					fontFamily: config.fontFamily
					fontSize: config.fontSize
				}
			}
		}
	}
}

