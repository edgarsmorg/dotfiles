import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

RectangleContainer {
	id: root
	required property HyprlandMonitor monitor

	property int iconSize: Math.max(8, Math.min(18, contentHeight - workspacePadding * 2))
	property int iconSpacing: Math.max(1, Math.floor(barHeight * 0.06))
	property int workspacePadding: Math.max(1, Math.min(5, Math.floor(contentHeight * 0.16)))
	readonly property var workspaceModel: {
		const allWorkspaces = Hyprland.workspaces.values;
		const normalWorkspaces = allWorkspaces.filter(w => w.id > 0 && w.monitor === root.monitor);
		const specialWorkspace = allWorkspaces.find(w =>
			w.name === "special:magic" && w.toplevels.values.length > 0
		);
		if (specialWorkspace)
			normalWorkspaces.push(specialWorkspace);
		return normalWorkspaces;
	}
	radius: implicitHeight / 2
	color: Theme.surface

	function iconSourceFor(window) {
		const appId = window.wayland?.appId || window.lastIpcObject?.class || "";
		if (!appId)
			return Quickshell.iconPath("application-x-executable");

		const entry = DesktopEntries.heuristicLookup(appId);
		return Quickshell.iconPath(entry?.icon || appId, "application-x-executable");
	}

	RowLayout {
		id: workspacesRow
		spacing: root.iconSpacing

		Repeater {
			model: root.workspaceModel

			Rectangle {
				required property var modelData
				property var windows: modelData.toplevels.values

				implicitWidth: Math.max(root.iconSize / 2, iconsRow.implicitWidth + root.workspacePadding * 2)
				implicitHeight: root.iconSize + root.workspacePadding * 2
				radius: implicitHeight / 2
				color: modelData.name === "special:magic"
					? Theme.specialWorkspace
					: modelData.active
						? (modelData.focused ? Theme.workspaceActive : Theme.workspaceActiveOther)
						: Theme.workspaceIdle

				RowLayout {
					id: iconsRow
					anchors.centerIn: parent
					spacing: 2

					Repeater {
						model: parent.parent.windows.slice(0, 3)

						ClippingWrapperRectangle {
							id: iconClip
							required property var modelData
							readonly property string appIconSource: root.iconSourceFor(modelData)
							implicitWidth: root.iconSize
							implicitHeight: root.iconSize
							radius: root.iconSize / 2
							color: "transparent"

							Image {
								anchors.fill: parent
								source: iconClip.appIconSource
								fillMode: Image.PreserveAspectFit
								mipmap: true
							}

							Layout.preferredWidth: root.iconSize
							Layout.preferredHeight: root.iconSize
						}
					}

					Rectangle {
						visible: parent.parent.windows.length > 3
						Layout.preferredWidth: 10
						Layout.preferredHeight: root.iconSize
						radius: width / 2
						color: Theme.surface

						Text {
							anchors.centerIn: parent
							text: "⋮"
							color: Theme.text
							font.pixelSize: Math.max(8, Math.round(14 * root.sizeScale))
						}
					}
				}

				MouseArea {
					anchors.fill: parent
					z: 1
					acceptedButtons: Qt.LeftButton
					onClicked: {
						if (modelData.name === "special:magic")
							Hyprland.dispatch("togglespecialworkspace magic");
						else
							modelData.activate();
					}
				}
			}
		}
	}
}
