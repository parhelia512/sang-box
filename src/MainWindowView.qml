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
    
    enum WorkState {
        Start,
        Stop
    }

    property int currentTabState: MainWindowView.TabState.Overview
    property int currentWorkState: MainWindowView.WorkState.Stop

    property int tabWidth: 804
    property int tabHeight: 705
    property int tabTopLeftRadius: 100
    property string tabColor: "#493855"

    property int smallControlMenuSpacing: 100

    property int fontSize: Size.pixel16

    property int margin: 52

    // Main tab Overview
    Rectangle {
        width: root.tabWidth
        height: root.tabHeight
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: root.tabColor
        topLeftRadius: root.tabTopLeftRadius

        visible: root.currentTabState === MainWindowView.TabState.Overview

        ColumnLayout {
            width: root.tabWidth - 104

            RowLayout {
                Layout.leftMargin: root.margin
                Layout.topMargin: root.margin
                spacing: root.smallControlMenuSpacing

                ControlMenu {
                    id: profilesMenu
                    labelText: qsTr("Profiles")
                    labelLeftMargin: 23

                    Layout.alignment: Qt.AlignLeft

                    ScrollView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        anchors.top: parent.label.bottom
                        anchors.topMargin: 16
                        anchors.right: parent.right
                        anchors.rightMargin: 16
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 16
                        anchors.left: parent.left
                        anchors.leftMargin: 16

                        ListView {
                            anchors.fill: parent
                            model: mainWindow.configListModel
                            spacing: 15

                            delegate: RowLayout {
                                width: parent.width

                                MRadioButton {
                                    accent: Theme.primary
                                    implicitHeight: Size.pixel16
                                    label.color: "black"
                                    text: model.name
                                    label.font.pixelSize: root.fontSize;
                                    checked: model.selected
                                    onClicked: {
                                        mainWindow.configListModel.switchConfig(index)
                                    }
                                }

                                Item {
                                    Layout.fillWidth: true
                                }

                                MButton {
                                    accent: Theme.passive
                                    type: MButton.Type.Text
                                    text: ""
                                    leftIcon.iconData: Icons.light.moreVert
                                    leftIcon.size: Size.pixel20

                                    onClicked: {
                                        configMenu.popup()
                                    }
                                }

                                Menu {
                                    id: configMenu
                                    implicitWidth: 120

                                    MenuItem {
                                        text: "Update"
                                        font.pixelSize: root.fontSize;
                                        iconData: Icons.light.download
                                        icon.height: Size.pixel16
                                        icon.width: Size.pixel16
                                    }

                                    MenuItem {
                                        text: "Edit"
                                        font.pixelSize: root.fontSize;
                                        iconData: Icons.light.edit
                                        icon.height: Size.pixel16
                                        icon.width: Size.pixel16
                                    }

                                    MenuItem {
                                        text: "Delete"
                                        font.pixelSize: root.fontSize;
                                        iconData: Icons.light.deleteElement
                                        icon.height: Size.pixel16
                                        icon.width: Size.pixel16
                                    }
                                }
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
                Layout.leftMargin: root.margin
                Layout.topMargin: 23
                verticalLineLeftMargin: 99.5

                MSwitch {
                    accent: Theme.primary
                    text: qsTr("Auto Scroll")
                    label.color: "black"
                    label.font.pixelSize: root.fontSize;
                    size: Size.Grade.M
                    anchors.top: parent.top
                    anchors.topMargin: 5.5
                    anchors.left: parent.verticalLine.right
                    anchors.leftMargin: 58.5 
                }

                ScrollView {
                    anchors.top: parent.horizontalLine.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 15

                    width: parent.width - 15
                    contentWidth: width

                    Text {
                        text: mainWindow.proxyOutput
                        width: parent.width
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }
    }

    // Additional tab Settings
    Rectangle {
        width: root.tabWidth
        height: root.tabHeight
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: root.tabColor
        topLeftRadius: root.tabTopLeftRadius
        visible: root.currentTabState === MainWindowView.TabState.Settings

        ColumnLayout {
            width: root.tabWidth - 104

            RowLayout {
                Layout.leftMargin: root.margin
                Layout.topMargin: root.margin
                spacing: root.smallControlMenuSpacing

                ControlMenu {
                    labelText: qsTr("Settings")
                    labelLeftMargin: 20

                    Layout.alignment: Qt.AlignLeft

                    ColumnLayout {
                        anchors.top: parent.horizontalLine.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.margins: 16

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
                Layout.leftMargin: root.margin
                Layout.topMargin: 23
                verticalLineLeftMargin: 132.5

                MSwitch {
                    accent: Theme.primary
                    text: qsTr("Blacklist")
                    label.color: "black"
                    label.font.pixelSize: root.fontSize;
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
            accent: mainWindow.runnigState ?
                        Theme.primary :
                        Theme.secondary
            radius: 28
            Layout.preferredWidth: 96
            Layout.preferredHeight: 96
            Layout.topMargin: 209
            Layout.alignment: Qt.AlignHCenter

            leftIcon.iconData: mainWindow.runnigState ?
                                   Icons.light.pause :
                                   Icons.light.playArrow
            leftIcon.size: Size.pixel36

            onClicked: {
                mainWindow.runnigState ?
                    mainWindow.stopProxy() :
                    mainWindow.startProxy()
            }
        }
    }
}
