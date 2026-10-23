import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

RectangleContainer {
	id: root

	property var lastPausedPlayer: null
	property var activePlayer: Mpris.players.values.find(player => player.isPlaying)
		?? (lastPausedPlayer
			&& lastPausedPlayer.playbackState === MprisPlaybackState.Paused
			&& Mpris.players.values.includes(lastPausedPlayer)
			? lastPausedPlayer
			: null)
		?? Mpris.players.values.find(player => player.playbackState === MprisPlaybackState.Paused)
		?? null
	property string fontFamily: "IosevkaTerm Nerd Font Mono"
	property int fontSize: 18

	visible: activePlayer !== null
	radius: implicitHeight / 2
	color: Theme.surface

	function formatTime(seconds) {
		const totalSeconds = Math.floor(seconds || 0);
		const minutes = Math.floor(totalSeconds / 60);
		const remainder = totalSeconds % 60;
		return minutes + ":" + ("0" + remainder).slice(-2);
	}

	Timer {
		interval: 1000
		repeat: true
		running: root.activePlayer !== null && root.activePlayer.isPlaying
		onTriggered: {
			if (root.activePlayer)
				root.activePlayer.positionChanged();
		}
	}

	Repeater {
		model: Mpris.players.values

		Item {
			required property var modelData
			width: 0
			height: 0

			Connections {
				target: modelData
				function onPlaybackStateChanged() {
					if (modelData.playbackState === MprisPlaybackState.Paused)
						root.lastPausedPlayer = modelData;
				}
			}
		}
	}

	RowLayout {
		spacing: 6

		Text {
			text: root.activePlayer?.isPlaying ? "⏸" : "▶"
			color: Theme.text
			font.family: root.fontFamily
			font.pixelSize: Math.max(9, Math.round((root.fontSize + 2) * root.sizeScale))

			MouseArea {
				anchors.fill: parent
				enabled: root.activePlayer !== null && root.activePlayer.canTogglePlaying
				cursorShape: Qt.PointingHandCursor
				onClicked: root.activePlayer.togglePlaying()
			}
		}

		Text {
			text: root.activePlayer
				? root.formatTime(root.activePlayer.position)
					+ (root.activePlayer.lengthSupported ? " / " + root.formatTime(root.activePlayer.length) : "")
				: ""
			color: Theme.text
			font.family: root.fontFamily
			font.pixelSize: Math.max(9, Math.round(root.fontSize * root.sizeScale))
		}

		Text {
			text: root.activePlayer ? root.activePlayer.identity : ""
			color: Theme.text
			font.family: root.fontFamily
			font.pixelSize: Math.max(9, Math.round(root.fontSize * root.sizeScale))
			width: Math.min(implicitWidth, 100)
			elide: Text.ElideRight
		}
	}
}
