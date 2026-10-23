pragma Singleton

import Quickshell
import QtQuick

Singleton {
	property color surface: Qt.rgba(27 / 255, 33 / 255, 34 / 255, 0.8)
	property color workspaceActive: Qt.rgba(129 / 255, 211 / 255, 222 / 255, 0.8)
	property color workspaceActiveOther: Qt.darker(workspaceActive, 1.3)
	property color workspaceIdle: Qt.rgba(37 / 255, 43 / 255, 44 / 255, 0.8)
	property color workspaceOccupied: "#b1cbcf"
	property color specialWorkspace: Qt.rgba(185 / 255, 198 / 255, 234 / 255, 0.8)
	property color text: "#dee4e4"
}
