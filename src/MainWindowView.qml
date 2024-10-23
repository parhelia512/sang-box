import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import MMaterial

Rectangle {
    id: root
    color: "#322A38"

    enum TabState {
        Overview,
        Settings
    }

    property int currentTabState: MainWindowView.TabState.Overview

    enum WorkState {
        Start,
        Stop
    }

    property int currentWorkState: MainWindowView.WorkState.Stop

    // Второе окно (Overview)
    Rectangle {
        width: 804
        height: 705
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "#493855"
        topLeftRadius: 100

        visible: root.currentTabState === MainWindowView.TabState.Overview

        ColumnLayout {
            width: 700

            RowLayout {
                Layout.leftMargin: 52
                Layout.topMargin: 52
                spacing: 100

                ControlMenu {
                    labelText: qsTr("Profiles")
                    labelLeftMargin: 23

                    Layout.alignment: Qt.AlignLeft
                }


                ControlMenu {
                    labelText: qsTr("Stats")
                    labelLeftMargin: 36

                    Layout.alignment: Qt.AlignRight
                }
            }

            ControlMenu {
                labelText: qsTr("Log")
                labelLeftMargin: 36

                Layout.fillWidth: true
                Layout.preferredHeight: 300
                Layout.leftMargin: 52
                Layout.topMargin: 23
                verticalLineLeftMargin: 99.5

                MSwitch {
                    accent: Theme.primary
                    text: qsTr("Auto Scroll")
                    label.color: "black"
                    size: Size.Grade.M
                    anchors.left: parent.verticalLine.right
                    anchors.top: parent.top
                    anchors.leftMargin: 58.5
                    anchors.topMargin: 5.5
                }

                Text  {
                    text: root.currentWorkState === MainWindowView.WorkState.Start ?
                              qsTr("The service is running. The log is active.") :
                              qsTr("The service has been stopped. The log is inactive.")
                    wrapMode: Text.WordWrap
                    width: parent.width - 15

                    anchors.top: parent.horizontalLine.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.topMargin: 5
                }
            }
        }
    }

    // Второе окно (Settings)
    Rectangle {
        width: 804
        height: 705
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "#493855"
        topLeftRadius: 100
        visible: root.currentTabState === MainWindowView.TabState.Settings // Управляем видимостью второго окна

        ColumnLayout {
            width: 700

            RowLayout {
                Layout.leftMargin: 52
                Layout.topMargin: 52
                spacing: 100

                ControlMenu {
                    labelText: qsTr("Settings")
                    labelLeftMargin: 20

                    Layout.alignment: Qt.AlignLeft
                }


                ControlMenu {
                    labelText: qsTr("Proxied apps")
                    labelLeftMargin: 10

                    Layout.alignment: Qt.AlignRight
                }
            }

            ControlMenu {
                labelText: qsTr("Domain routing")
                labelLeftMargin: 10

                Layout.fillWidth: true
                Layout.preferredHeight: 300
                Layout.leftMargin: 52
                Layout.topMargin: 23
                verticalLineLeftMargin: 132.5

                MSwitch {
                    accent: Theme.primary
                    text: qsTr("Blacklist")
                    label.color: "black"
                    size: Size.Grade.M
                    anchors.left: parent.verticalLine.right
                    anchors.top: parent.top
                    anchors.leftMargin: 42.5
                    anchors.topMargin: 5.5
                }
            }
        }
    }

    ColumnLayout {
        width: 196
        anchors.left: parent.left

        MenuButton {
            Layout.preferredWidth: 175
            Layout.topMargin: 30
            type: root.currentTabState === MainWindowView.TabState.Overview ?
                      MButton.Type.Contained :
                      MButton.Type.Text
            leftIcon.iconData: Icons.light.accountCircle
            text: qsTr("Overview")

            onClicked: root.currentTabState = MainWindowView.TabState.Overview
        }

        MenuButton {
            Layout.preferredWidth: 175
            Layout.topMargin: 35
            type: root.currentTabState === MainWindowView.TabState.Settings ?
                      MButton.Type.Contained :
                      MButton.Type.Text

            leftIcon.iconData: Icons.light.accountCircle
            text: qsTr("Settings")

            onClicked: root.currentTabState = MainWindowView.TabState.Settings
        }

        MFabButton {
            accent: root.currentWorkState === MainWindowView.WorkState.Stop ?
                        Theme.secondary :
                        Theme.primary
            radius: 28
            Layout.preferredWidth: 80
            Layout.preferredHeight: 80
            Layout.topMargin: 209
            Layout.alignment: Qt.AlignHCenter

            leftIcon.iconData: root.currentWorkState === MainWindowView.WorkState.Stop ?
                                   Icons.light.playArrow :
                                   Icons.light.pause
            leftIcon.size: Size.pixel64

            onClicked: {
                root.currentWorkState = (root.currentWorkState === MainWindowView.WorkState.Stop) ?
                            MainWindowView.WorkState.Start :
                            MainWindowView.WorkState.Stop
            }
        }
    }
}
