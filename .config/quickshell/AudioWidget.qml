import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RectangleContainer {
	id: root

	property var sink: Pipewire.defaultAudioSink
	property var source: Pipewire.defaultAudioSource
	property string fontFamily: "IosevkaTerm Nerd Font Mono"
	property int fontSize: 18
	property bool popupOpen: false

	radius: implicitHeight / 2
	color: Theme.surface

	PwObjectTracker {
		objects: [root.sink, root.source]
	}

	Text {
		text: {
			if (!root.sink || !root.sink.audio)
				return "󰖁 --";
			if (root.sink.audio.muted)
				return "󰖁 " + Math.round(root.sink.audio.volume * 100) + "%";
			return (root.sink.audio.volume >= 0.5 ? "󰕾 " : "󰖀 ")
				+ Math.round(root.sink.audio.volume * 100) + "%";
		}
		color: Theme.text
		font.family: root.fontFamily
		font.pixelSize: Math.max(9, Math.round(root.fontSize * root.sizeScale))

		MouseArea {
			anchors.fill: parent
			cursorShape: Qt.PointingHandCursor
			onClicked: root.popupOpen = !root.popupOpen
			onWheel: event => {
				if (!root.sink || !root.sink.audio)
					return;
				root.sink.audio.volume = Math.max(0, Math.min(1.5,
					root.sink.audio.volume + (event.angleDelta.y > 0 ? 0.05 : -0.05)));
				event.accepted = true;
			}
		}
	}

	PopupWindow {
		id: popup
		anchor.item: root
		anchor.edges: Edges.Bottom | Edges.Right
		anchor.gravity: Edges.Bottom | Edges.Left
		width: 320
		height: content.implicitHeight + 24
		visible: root.popupOpen
		color: "transparent"
		grabFocus: true
		onVisibleChanged: {
			if (!visible)
				root.popupOpen = false;
		}

		Rectangle {
			anchors.fill: parent
			color: Theme.surface
			radius: 14
			border.color: Qt.rgba(Theme.text.r, Theme.text.g, Theme.text.b, 0.12)
			border.width: 1

			ColumnLayout {
				id: content
				anchors.fill: parent
				anchors.margins: 14
				spacing: 14

				ColumnLayout {
					Layout.fillWidth: true
					spacing: 6

					RowLayout {
						Layout.fillWidth: true
						Text {
							Layout.fillWidth: true
							text: "Salida"
							color: Theme.text
							font.family: root.fontFamily
							font.pixelSize: root.fontSize
						}
						Text {
							text: root.sink?.audio ? Math.round(root.sink.audio.volume * 100) + "%" : "—"
							color: Theme.text
							font.family: root.fontFamily
							font.pixelSize: root.fontSize - 2
						}
						Text {
							text: root.sink?.audio?.muted ? "󰖁" : "󰕾"
							color: Theme.text
							font.family: root.fontFamily
							font.pixelSize: root.fontSize
							MouseArea {
								anchors.fill: parent
								cursorShape: Qt.PointingHandCursor
								onClicked: if (root.sink?.audio) root.sink.audio.muted = !root.sink.audio.muted
							}
						}
					}
					Slider {
						id: outputSlider
						Layout.fillWidth: true
						from: 0
						to: 1.5
						value: root.sink?.audio ? root.sink.audio.volume : 0
						enabled: root.sink?.audio !== null && root.sink !== null
						onMoved: if (root.sink?.audio) root.sink.audio.volume = value
						background: Rectangle {
							x: outputSlider.leftPadding
							y: outputSlider.topPadding + outputSlider.availableHeight / 2 - height / 2
							width: outputSlider.availableWidth
							height: 4
							radius: height / 2
							color: Theme.workspaceIdle

							Rectangle {
								width: outputSlider.visualPosition * parent.width
								height: parent.height
								radius: parent.radius
								color: Theme.workspaceActive
							}
						}
						handle: Rectangle {
							x: outputSlider.leftPadding + outputSlider.visualPosition * (outputSlider.availableWidth - width)
							y: outputSlider.topPadding + outputSlider.availableHeight / 2 - height / 2
							implicitWidth: 14
							implicitHeight: 14
							radius: width / 2
							color: outputSlider.pressed ? Theme.workspaceActive : Theme.text
							border.color: Theme.surface
							border.width: 2
						}
					}
					Text {
						Layout.fillWidth: true
						text: root.sink ? (root.sink.description || root.sink.name) : "Sin dispositivo de salida"
						color: Theme.text
						opacity: 0.7
						font.family: root.fontFamily
						font.pixelSize: root.fontSize - 4
						elide: Text.ElideRight
					}
				}

				Rectangle { Layout.fillWidth: true; height: 1; color: Qt.rgba(Theme.text.r, Theme.text.g, Theme.text.b, 0.12) }

				ColumnLayout {
					Layout.fillWidth: true
					spacing: 6

					RowLayout {
						Layout.fillWidth: true
						Text {
							Layout.fillWidth: true
							text: "Entrada"
							color: Theme.text
							font.family: root.fontFamily
							font.pixelSize: root.fontSize
						}
						Text {
							text: root.source?.audio ? Math.round(root.source.audio.volume * 100) + "%" : "—"
							color: Theme.text
							font.family: root.fontFamily
							font.pixelSize: root.fontSize - 2
						}
						Text {
							text: root.source?.audio?.muted ? "󰍭" : "󰍬"
							color: Theme.text
							font.family: root.fontFamily
							font.pixelSize: root.fontSize

							MouseArea {
							anchors.fill: parent
							cursorShape: Qt.PointingHandCursor
							onClicked: if (root.source?.audio) root.source.audio.muted = !root.source.audio.muted
							}
						}
					}
					Slider {
						id: inputSlider
						Layout.fillWidth: true
						from: 0
						to: 1.5
						value: root.source?.audio ? root.source.audio.volume : 0
						enabled: root.source?.audio !== null && root.source !== null
						onMoved: if (root.source?.audio) root.source.audio.volume = value
						background: Rectangle {
							x: inputSlider.leftPadding
							y: inputSlider.topPadding + inputSlider.availableHeight / 2 - height / 2
							width: inputSlider.availableWidth
							height: 4
							radius: height / 2
							color: Theme.workspaceIdle

							Rectangle {
								width: inputSlider.visualPosition * parent.width
								height: parent.height
								radius: parent.radius
								color: Theme.workspaceActive
							}
						}
						handle: Rectangle {
							x: inputSlider.leftPadding + inputSlider.visualPosition * (inputSlider.availableWidth - width)
							y: inputSlider.topPadding + inputSlider.availableHeight / 2 - height / 2
							implicitWidth: 14
							implicitHeight: 14
							radius: width / 2
							color: inputSlider.pressed ? Theme.workspaceActive : Theme.text
							border.color: Theme.surface
							border.width: 2
						}
					}
					Text {
						Layout.fillWidth: true
						text: root.source ? (root.source.description || root.source.name) : "Sin dispositivo de entrada"
						color: Theme.text
						opacity: 0.7
						font.family: root.fontFamily
						font.pixelSize: root.fontSize - 4
						elide: Text.ElideRight
					}
				}
			}
		}
	}
}
