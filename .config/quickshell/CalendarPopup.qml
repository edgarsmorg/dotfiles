import Quickshell
import QtQuick
import QtQuick.Layouts

PopupWindow {
	id: root

	property Item anchorTarget
	property int displayedYear: new Date().getFullYear()
	property int displayedMonth: new Date().getMonth()
	readonly property date today: new Date()
	readonly property date monthStart: new Date(displayedYear, displayedMonth, 1)
	readonly property int monthOffset: (monthStart.getDay() + 6) % 7
	readonly property int daysInMonth: new Date(displayedYear, displayedMonth + 1, 0).getDate()
	readonly property string monthTitle: Qt.locale().standaloneMonthName(displayedMonth + 1, Locale.LongFormat)
	readonly property var weekdays: ["L", "M", "X", "J", "V", "S", "D"]
	signal dismissed()

	anchor.item: root.anchorTarget
	anchor.edges: Edges.Bottom | Edges.Right
	anchor.gravity: Edges.Bottom | Edges.Left
	anchor.margins.bottom: -6
	width: 280
	height: 316
	color: "transparent"
	grabFocus: true
	onVisibleChanged: if (!visible) root.dismissed()

	Rectangle {
		anchors.fill: parent
		color: Theme.surface
		radius: 14
		border.color: Qt.rgba(Theme.text.r, Theme.text.g, Theme.text.b, 0.12)
		border.width: 1

		ColumnLayout {
			anchors.fill: parent
			anchors.margins: 14
			spacing: 12

			RowLayout {
				Layout.fillWidth: true
				Text {
					text: "‹"
					color: Theme.text
					font.pixelSize: 24
					MouseArea {
						anchors.fill: parent
						cursorShape: Qt.PointingHandCursor
						onClicked: {
							if (root.displayedMonth === 0) {
								root.displayedMonth = 11;
								root.displayedYear--;
							} else root.displayedMonth--;
						}
					}
				}
				Text {
					Layout.fillWidth: true
					text: root.monthTitle + " " + root.displayedYear
					color: Theme.text
					font.pixelSize: 16
					font.bold: true
					horizontalAlignment: Text.AlignHCenter
				}
				Text {
					text: "›"
					color: Theme.text
					font.pixelSize: 24
					MouseArea {
						anchors.fill: parent
						cursorShape: Qt.PointingHandCursor
						onClicked: {
							if (root.displayedMonth === 11) {
								root.displayedMonth = 0;
								root.displayedYear++;
							} else root.displayedMonth++;
						}
					}
				}
			}

			GridLayout {
				Layout.fillWidth: true
				Layout.fillHeight: true
				columns: 7
				uniformCellWidths: true
				rowSpacing: 4
				columnSpacing: 4

				Repeater {
					model: root.weekdays
					Text {
						Layout.fillWidth: true
						Layout.preferredHeight: 28
						text: modelData
						color: Theme.text
						opacity: 0.65
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
					}
				}

				Repeater {
					model: 42
					delegate: Rectangle {
						readonly property int dayNumber: index - root.monthOffset + 1
						readonly property bool inMonth: dayNumber >= 1 && dayNumber <= root.daysInMonth
						readonly property bool isToday: inMonth
							&& root.displayedYear === root.today.getFullYear()
							&& root.displayedMonth === root.today.getMonth()
							&& dayNumber === root.today.getDate()
						Layout.fillWidth: true
						Layout.preferredHeight: 28
						radius: width / 2
						color: isToday ? Theme.workspaceActive : "transparent"

						Text {
							anchors.fill: parent
							text: parent.inMonth ? parent.dayNumber : ""
							color: parent.isToday ? Theme.surface : Theme.text
							horizontalAlignment: Text.AlignHCenter
							verticalAlignment: Text.AlignVCenter
						}
					}
				}
			}
		}
	}
}
