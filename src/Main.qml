import QtQuick
import QtQuick.Controls.Material
import MMaterial

Window {
    width: 1000
    height: 750
	visible: true
	color: Theme.background.main
    title: qsTr("sang-box")

    minimumWidth: 1000
    minimumHeight: 750
    maximumWidth: 1000
    maximumHeight: 750

	MainWindowView {
		anchors.fill: parent
	}
}
