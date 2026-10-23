import QtQuick

RectangleContainer {
	id: root

	property color textColor: Theme.text
	property string fontFamily: "IosevkaTerm Nerd Font Mono"
	property int fontSize: 18

	radius: implicitHeight / 2
	color: Theme.surface

	ActiveWindowWidget {
		color: root.textColor
		font {
			family: root.fontFamily
			pixelSize: Math.max(9, Math.round(root.fontSize * root.sizeScale))
		}
	}
}
