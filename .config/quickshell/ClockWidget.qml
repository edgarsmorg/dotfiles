import QtQuick

Item {
	id: root

	property bool calendarOpen: false
	property int barHeight: 50
	property string fontFamily: "IosevkaTerm Nerd Font Mono"
	property int fontSize: 18
	property alias textColor: clockText.color

	implicitWidth: clockContainer.implicitWidth
	implicitHeight: clockContainer.implicitHeight

	RectangleContainer {
		id: clockContainer
		anchors.fill: parent
		barHeight: root.barHeight
		radius: implicitHeight / 2
		color: Theme.surface

		Text {
			id: clockText
			text: Time.time
			color: Theme.text
			font.family: root.fontFamily
			font.pixelSize: Math.max(9, Math.round(root.fontSize * clockContainer.sizeScale))

			MouseArea {
				anchors.fill: parent
				cursorShape: Qt.PointingHandCursor
				onClicked: root.calendarOpen = !root.calendarOpen
			}
		}
	}

	CalendarPopup {
		anchorTarget: clockContainer
		visible: root.calendarOpen
		onDismissed: root.calendarOpen = false
	}
}
