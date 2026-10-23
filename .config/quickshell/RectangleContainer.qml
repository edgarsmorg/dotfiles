import QtQuick

Rectangle {
	id: root

	default property alias content: contentItem.data

	property int barHeight: 50
	readonly property int availableHeight: Math.max(1, barHeight - 6)
	readonly property real sizeScale: Math.min(1, availableHeight / 44)
	property int padding: Math.max(2, Math.min(6, Math.floor(availableHeight)))
	property int horizontalPadding: Math.max(7, Math.min(11, Math.floor(availableHeight)))
	property int contentHeight: Math.max(10, availableHeight - padding * 2)

	implicitWidth: contentItem.childrenRect.width + horizontalPadding * 2
	implicitHeight: contentHeight + padding * 2

	Item {
		id: contentItem
		width: childrenRect.width
		height: childrenRect.height
		anchors.centerIn: parent
	}
}
