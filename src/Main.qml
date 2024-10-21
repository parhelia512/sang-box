import QtQuick
import QtQuick.Controls.Material
import MMaterial

Window {
	width: 640
	height: 480
	visible: true
	color: Theme.background.main
	title: qsTr("Hello World")

	MainWindowView {
		anchors.fill: parent
	}
}
