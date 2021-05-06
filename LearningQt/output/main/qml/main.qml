import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3
import "controls"

Window {
    id: mainwindow
    width: 1000
    height: 580
    minimumWidth:800
    minimumHeight:500
    opacity: 1
    visible: true
    color: "#00000000"
    title: qsTr("Made by Humans on Earth")

    //remove the title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    //Properties
    property int windowStatus: 0 //0 = application in normal status
                                 //1 = application is maximized

    // Load the properties that are on the current page of stackview
    // documentation https://doc.qt.io/qt-5/qtqml-syntax-objectattributes.html#:~:text=Property%20Aliases&text=Unlike%20an%20ordinary%20property%20definition,property%20(the%20aliased%20property).
    property alias actualPage: stackView.currentItem

    //Internal functions
    QtObject{
        id: internal

        function toggleResizeMarkers(value)
        {
            resizeBottom.visible = value
            resizeTop.visible = value
            resizeRight.visble = value
            resizeLeft.visible = value
            reizeBottomRightCorner.visible = value
        }

        function maximizeRestore(){
            if(windowStatus == 0){ //app in normal status
                mainwindow.showMaximized()
                btnMaximize.btnIconSource = "../images/svg_images/restore_icon.svg"
                windowStatus = 1 //app now in fullscreen
                internal.toggleResizeMarkers(!windowStatus) //we want all of the resize things to not be visible now, so we pass in zero
            }
            else{
                mainwindow.showNormal()
                btnMaximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
                windowStatus = 0
                internal.toggleResizeMarkers(!windowStatus) //we want all of the resize things to not be visible now, so we pass in zero
            }
        }

        //for taking care of the case where you fullscreen the window but then you use drag the top bar down
        //to return it to normal size instead of clicking the maximize button again. the window status variable needs to be updated.
        function updateWindowStatus(){
            windowStatus = 0
            btnMaximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }

    }


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
                                             internal.updateWindowStatus()
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
                        onClicked: mainwindow.showMinimized()

                        /*
                          to execute multiple functions:
                          do
                          onClicked: {
                            //function call 1
                            //function call 2
                            //etc..
                          }

                        */

                    }

                    TopBarButton {
                        id: btnMaximize
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#d3299a"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked:mainwindow.close()
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

                        duration: 500   //duration of the animation in milliseconds.
                        easing.type: Easing.InOutQuint //Type of animation to use.
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

                            onClicked: {
                                //isActiveMenu is a variable we defined in the LeftMenuBtn QML file.
                                btnHome.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                                //pagesView.setSource(Qt.resolvedUrl("pages/homePage.qml"))
                                //homePageView.visible = true
                                //settingsPageView.visible = false
                            }

                        }

                        LeftMenuBtn {
                            id: btnOpen
                            width: leftmenu.width
                            text: qsTr("Open")
                            btnIconSource: "../images/svg_images/open_icon.svg"

                            onPressed: {
                                fileOpen.open()
                            }

                            FileDialog {
                                id: fileOpen
                                title: "Please choose a text file"
                                folder: shortcuts.home
                                selectMultiple: false
                                nameFilters: ["Text File (*.txt)"]
                                onAccepted: {
                                    backend.openTextFile(fileOpen.fileUrl)
                                }
                            }
                        }

                        LeftMenuBtn {
                            id: btnSave
                            width: leftmenu.width
                            text: qsTr("Save")
                            btnIconSource: "../images/svg_images/save_icon.svg"

                            onPressed: {
                                fileClose.open()
                            }

                            FileDialog {
                                id: fileClose
                                title: "Save file"
                                folder: shortcuts.home
                                selectMultiple: false
                                nameFilters: ["Text File (*.txt)"]
                                selectExisting: false
                                onAccepted: { //the file has been chosen the user clicks okay
                                    backend.saveTextFile(actualPage.getText, fileClose.fileUrl)
                                }
                            }

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

                        onClicked: {
                            //isActiveMenu is a variable we defined in the LeftMenuBtn QML file.
                            btnHome.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/SettingsPage.qml"))
                            //pagesView.setSource(Qt.resolvedUrl("pages/SettingsPage.qml"))
                            //homePageView.visible = false
                            //settingsPageView.visible = true
                        }



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

                    //This is one method for loading pages, below is another.


                    StackView {
                        id: stackView
                        visible: true
                        anchors.fill: parent
                        clip: true
                        // initialItem: Qt.resolvedUrl("pages/homePage.qml") //set the starting item that is shown in stackView
                        initialItem: Qt.resolvedUrl("pages/textEditor.qml")
                    }


                    //StackView uses animations, but loader does not. also stackview literally works like a stack.
                    //Disadvantage with stackView: when the pages are changed, they are actually reloaded and they lose
                    //all the informaiton they had on it previously.
                    //well apparently after all that explanation, we are going to be using StackView
                    /*
                    Loader{
                        id:homePageView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/homePage.qml")
                        visible: true
                    }

                    Loader{
                        id:settingsPageView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/SettingsPage.qml")
                        visible : false
                    }
                    */

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

                    MouseArea {
                        id: reizeBottomRightCorner
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0

                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler {
                            target: null
                            onActiveChanged: if(active){mainwindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)}
                        }

                        Image {
                            id: resizeImage
                            width: 16
                            height: 16
                            anchors.fill: parent
                            anchors.topMargin: 5
                            anchors.leftMargin: 5
                            source: "../images/svg_images/resize_icon.svg"
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false

                        }

                        ColorOverlay{
                            anchors.fill:resizeImage //this uses anchoring based on image above
                            source: resizeImage
                            color: "#000000"
                            antialiasing: false
                            width: resizeImage.width
                            height: resizeImage.height
                        }
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

    //Resizing on the left edge
    MouseArea {
        id: resizeLeft
        width: 7
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 7
        anchors.topMargin: 7

        cursorShape:  Qt.SizeHorCursor

        DragHandler {
            target:null
            onActiveChanged: if (active) { mainwindow.startSystemResize(Qt.LeftEdge)}
        }
    }

    //Resizing the right edge
    MouseArea {
        id: resizeRight
        width: 7
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 25
        anchors.topMargin: 7

        cursorShape:  Qt.SizeHorCursor

        DragHandler {
            target:null
            onActiveChanged: if (active) { mainwindow.startSystemResize(Qt.RightEdge)}
        }
    }

    //resizing the bottom edge
    MouseArea {
        id: resizeBottom
        height: 7
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.rightMargin: 25
        anchors.leftMargin: 7
        anchors.bottomMargin: 0

        cursorShape:  Qt.SizeVerCursor

        DragHandler {
            target:null
            onActiveChanged: if (active) { mainwindow.startSystemResize(Qt.BottomEdge)}
        }
    }

    //resizing the top edge
    MouseArea {
        id: resizeTop
        height: 7
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.rightMargin: 7
        anchors.leftMargin: 7
        anchors.topMargin: 0

        cursorShape:  Qt.SizeVerCursor

        DragHandler {
            target:null
            onActiveChanged: if (active) { mainwindow.startSystemResize(Qt.TopEdge)}
        }
    }

    Connections {
        target: backend

        function onReadText(text){
            actualPage.setText = text
        }
    }




}





/*##^##
Designer {
    D{i:0}D{i:39;invisible:true}
}
##^##*/
