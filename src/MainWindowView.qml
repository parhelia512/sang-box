import QtQuick
import QtQuick.Controls.Material
import MMaterial

Rectangle {
	color: Theme.background.main

	MFabButton {
		rightIcon.iconData: Icons.light.playArrow
		rightIcon.size: Size.pixel64
	}
}
