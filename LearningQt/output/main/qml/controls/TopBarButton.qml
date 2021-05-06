//fyi all of these imports are custom
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnTopBar
    width: 35
    height: 35

    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/minimize_icon.svg"
    property color btnColorDefault: "#264d73"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal
        // MOUSE OVER AND MOUSE CLICK CHANGE COLOR
        property var dynamicColor : if(btnTopBar.down)
                                    {
                                        btnTopBar.down ? btnColorClicked : btnColorDefault
                                    }
                                    else
                                    {
                                        btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                    }
    }


    background: Rectangle {
        id:bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource //pass in the image source here
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: false
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }

}
