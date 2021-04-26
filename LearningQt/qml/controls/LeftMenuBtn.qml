//fyi all of these imports are custom
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnLeftMenu
    text: qsTr("Electornics Garage") //without the function call, the text appears normally as well.
                                // see https://doc.qt.io/qt-5/qtquick-internationalization.html

    //CUSTOM PROPERTIES, these are basically like variables!!
    property url btnIconSource: "../../images/svg_images/home_icon.svg"
    property color btnColorDefault: "#264d73"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColorLeft: "#55aaff"
    property bool isActiveMenu: false
    property color activeMenuColorRight: "#c0c0c0"

    QtObject{
        id: internal
        // MOUSE OVER AND MOUSE CLICK CHANGE COLOR
        property var dynamicColor : if(btnLeftMenu.down)
                                    {
                                        btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                    }
                                    else
                                    {
                                        btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                    }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle {
        id:bgBtn
        color: internal.dynamicColor

        //left side of button
        Rectangle {
            anchors { //another way to fill in all of the anchors
                top: parent.top
                left: parent.left
                bottom:parent.bottom
            }
            width: 3
            visible: isActiveMenu
            color: "#ffffff" //need this set this or it wont show!!
        }

        Rectangle {
            anchors { //another way to fill in all of the anchors
                top: parent.top
                right: parent.right
                bottom:parent.bottom
            }
            width: 5
            visible: isActiveMenu
            color: "#55aaff" //need this set this or it wont show!!
        }

    }

    contentItem: Item{
        anchors.fill: parent
        id: content
            Image {
                id: iconBtn
                source: btnIconSource
                anchors.leftMargin: 26
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                sourceSize.width: iconWidth //whats the difference between sourceSize.width and just plain old width?
                sourceSize.height: iconHeight
                width: iconWidth
                height: iconHeight
                fillMode: Image.PreserveAspectFit
                visible: false
                antialiasing: true
            }

            ColorOverlay{
                anchors.fill:iconBtn //this uses anchoring based on image above
                source: iconBtn
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                width: iconWidth
                height: iconHeight
            }

            Text{
                color:"#ffffff"
                text: btnLeftMenu.text
                font: btnLeftMenu.font
                anchors.verticalCenter: parent.verticalCenter //set it to the vertical center of the parent? otheriwse,
                                                              //it would have placed the text in the upper left corner of the rect
                anchors.left: parent.left //set the left anchor
                anchors.leftMargin: 75 //give it a margin (offset)

            }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9;height:60;width:250}
}
##^##*/
