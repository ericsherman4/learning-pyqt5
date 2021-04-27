import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import "controls"

Window {
    id: mainwindow
    width: 1000
    height: 580
    opacity: 1
    visible: true
    title: qsTr("Made by Humans on Earth")

    //remove the title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: background
        color: "#00000000"
        border.color: "#000000"
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: appcontainer
            color: "#55aaff"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topbar
                width: 0
                height: 60
                color: "#264d73"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    //you can overwrite attributes defined in this qml file but just specifying the attribute here.
                    // for example like btnColorClicked: "#ffffff" will overwrit the value specified in ToggleButton.qml
                    //dont need to put anything here because its all defined in that other QML file.

                    //this starts the animation. you are calling running on the animation id animationMenu

                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topbardescription
                    y: 17
                    height: 25
                    color: "#5097da"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labeltopinfo
                        color: "#1c3a55"
                        text: qsTr("Application description will go here.")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 8
                        anchors.rightMargin: 302
                        anchors.leftMargin: 8
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#1c3a55"
                        text: qsTr("[ HOME ]")
                        anchors.left: labeltopinfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        font.pointSize: 8
                    }
                }

                Rectangle {
                    id: titlebar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    //functions for being able to drag the window around
                    DragHandler{
                        onActiveChanged: if(active){
                                             mainwindow.startSystemMove()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/icon_app_top.svg"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#ffffff"
                        text: qsTr("Supercomputer.io")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: row
                    x: 965
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton{
                        id: btnMinimize

                    }

                    TopBarButton {
                        id: btnMaximize
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#d3299a"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topbar.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: leftmenu
                    width: 70
                    color: "#1c3a55"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    // stuff for expanding and collapsing the Menu
                    PropertyAnimation {
                        id: animationMenu
                        target: leftmenu
                        property:"width" //the property you want to animate
                        //to: 250          //the width you want the animation to go to.

                        property int expandedwidth: 200
                        property int retractedwidth: 70

                        to: leftmenu.width == expandedwidth ? retractedwidth : expandedwidth //set the to value to be 70 if its already expanded, otherwise set it to 250

                        //or you can code it like this
                        //to: if(leftmenu.width == 70) return 200; else return 70

                        duration: 1000   //duration of the animation in milliseconds.
                        easing.type: Easing.OutBounce //Type of animation to use.
                    }

                    Column {
                        id: column
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: true
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftmenu.width
                            text: qsTr("Home")
                            isActiveMenu: true

                        }

                        LeftMenuBtn {
                            id: btnOpen
                            width: leftmenu.width
                            text: qsTr("Open")
                            btnIconSource: "../images/svg_images/open_icon.svg"
                        }

                        LeftMenuBtn {
                            id: btnSave
                            width: leftmenu.width
                            text: qsTr("Save")
                            btnIconSource: "../images/svg_images/save_icon.svg"
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        x: 0
                        y: 180
                        width: leftmenu.width
                        text: qsTr("Settings")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 25
                        btnIconSource: "../images/svg_images/settings_icon.svg"
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#00000000"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 25
                }

                Rectangle {
                    id: rectangle
                    color: "#5097da"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelBottomInfo
                        color: "#1c3a55"
                        text: qsTr("Application description will go here.")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.leftMargin: 8
                        anchors.rightMargin: 30
                        font.pointSize: 8
                        anchors.bottomMargin: 0
                    }
                }
            }
        }
    }

//    //adding drop shadow?
      //I think this doesnt work because i removed that transparent border where i think this shadow would go.

//    DropShadow{
//        anchors.fill :bg
//        horizontalOffset: 0
//        verticalOffset: 0
//        radius: 10
//        samples:16
//        color: "#80000000"
//        source:bg
//        z:0

//    }



}




