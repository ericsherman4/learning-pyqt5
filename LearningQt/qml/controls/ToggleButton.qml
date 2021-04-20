//fyi all of these imports are custom
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnToggle
    implicitWidth: 70
    implicitHeight: 60

    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/menu_icon.svg"
    property color btnColorDefault: "#264d73"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal
        // MOUSE OVER AND MOUSE CLICK CHANGE COLOR
        property var dynamicColor : if(btnToggle.down)
                                    {
                                        btnToggle.down ? btnColorClicked : btnColorDefault
                                    }
                                    else
                                    {
                                        btnToggle.hovered ? btnColorMouseOver : btnColorDefault
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
            height: 25
            width: 25
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
