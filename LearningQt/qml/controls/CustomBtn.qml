import QtQuick 2.4
import QtQuick.Controls 2.15

Button {
    id: changeNameBtn
    //text:  qsTr("Change Name")

    property color colorHovered : "#345b7c"
    property color colorPressed : "#345b7c"
    property color colorDefault : "#55aaff"



    QtObject {
        id: internal
        property var dynamicColor: if(changeNameBtn.down){
                                       changeNameBtn.down ? colorPressed : colorDefault
                                   }
                                   else{
                                       changeNameBtn.hovered ? colorHovered : colorDefault
                                   }
    }

    Text {
        text: qsTr("Change Name")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ffffff"
    }


    implicitWidth: 200
    implicitHeight: 40
    visible: true



    background: Rectangle {
        color: internal.dynamicColor
        radius: 10
    }
}





/*##^##
Designer {
    D{i:0;height:40;width:200}
}
##^##*/
