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

                    ScrollView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        anchors.top: parent.label.bottom
                        anchors.topMargin: 16
                        anchors.right: parent.right
                        anchors.rightMargin: 6
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 16
                        anchors.left: parent.left
                        anchors.leftMargin: 16

                        ListView {
                            anchors.fill: parent
                            model: mainWindow.configListModel
                            spacing: 15

                            delegate: MRadioButton {
                                accent: Theme.primary
                                implicitHeight: Size.pixel16
                                label.color: "black"
                                text: model.name
                            }
                        }
                    }
                }


                ControlMenu {
                    labelText: qsTr("Stats")
                    labelLeftMargin: 31

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
                    label.font.pixelSize: 16;
                    size: Size.Grade.M
                    anchors.top: parent.top
                    anchors.topMargin: 5.5
                    anchors.left: parent.verticalLine.right
                    anchors.leftMargin: 58.5 
                }

                Text  {
                    text: root.currentWorkState === MainWindowView.WorkState.Start ?
                              qsTr("The service is running. The log is active.") :
                              qsTr("The service has been stopped. The log is inactive.")
                    wrapMode: Text.WordWrap
                    width: parent.width - 15

                    anchors.top: parent.horizontalLine.bottom
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 15
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

                    ColumnLayout {
                        anchors.top: parent.horizontalLine.bottom
                        anchors.topMargin: 15
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 15

                        spacing: 15

                        RowLayout {
                            MCheckbox {
                                id: startOnBootCheck
                                accent: Theme.primary

                                implicitHeight: Size.pixel22
                                implicitWidth: Size.pixel22
                            }

                            Label { text: qsTr("Start on boot"); font.pixelSize: 16; Layout.leftMargin: 12 }
                        }

                        RowLayout {
                            MCheckbox {
                                id: autoUpdatesCheck
                                accent: Theme.primary

                                implicitHeight: Size.pixel22
                                implicitWidth: Size.pixel22
                            }

                            Label { text: qsTr("Automatic updates"); font.pixelSize: 16; Layout.leftMargin: 12 }
                        }

                        RowLayout {
                            MCheckbox {
                                id: preReleaseCheck
                                accent: Theme.primary

                                implicitHeight: Size.pixel22
                                implicitWidth: Size.pixel22
                            }

                            Label { text: qsTr("Pre-release"); font.pixelSize: 16; Layout.leftMargin: 12 }
                        }

                        ColumnLayout {
                            Layout.topMargin: 10
                            spacing: 5

                            RowLayout {
                                Label { text: qsTr("App version:"); font.pixelSize: 16; Layout.leftMargin: 3 }
                                Label { text: qsTr("0.1"); font.pixelSize: 16; color: "green"; Layout.leftMargin: 5 }
                            }

                            RowLayout {
                                Label { text: qsTr("Core version:"); font.pixelSize: 16; Layout.leftMargin: 3 }
                                Label { text: qsTr("1.10.0"); font.pixelSize: 16; color: "red"; Layout.leftMargin: 5 }
                            }
                        }

                        MFabButton {
                            accent: Theme.primary
                            radius: 100
                            Layout.preferredWidth: 112
                            Layout.preferredHeight: 40
                            Layout.topMargin: 4
                            Layout.alignment: Qt.AlignRight

                            leftIcon.iconData: Icons.light.download
                            leftIcon.size: Size.pixel20

                            text: qsTr("Update")
                        }
                    }
                }


                ControlMenu {
                    labelText: qsTr("Proxied apps")
                    labelLeftMargin: 10
                    verticalLineLeftMargin: 114.5

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
                    label.font.pixelSize: 16;
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
