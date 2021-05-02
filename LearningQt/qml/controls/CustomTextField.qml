import QtQuick 2.0
import QtQuick.Controls 2.15


TextField {
    id: textField
    width: 640
    height: 40
    placeholderText: qsTr("Type something")
    //placeholderTextColor: "#a1b1df"
    //color : "#a1b1df"

    placeholderTextColor: "#ffffff"
    color : "#ffffff"


    property color defaultColor: "#345b7c"
    property color hoverColor : "#234a6b"
    property color focusColor : "#1c3a55"


    QtObject {
        id: internal
        property var dynamicColor : if(textField.activeFocus){
                                        textField.activeFocus ? focusColor : defaultColor
                                    } else{
                                        textField.hovered ? hoverColor : defaultColor
                                    }
    }

    background: Rectangle {
        radius: 10
        color: internal.dynamicColor
    }

    implicitWidth: 300
    implicitHeight: 40

    selectByMouse: true
    selectedTextColor: "#ffffff"
    selectionColor: "#4f7db2"


}







/*##^##
Designer {
    D{i:0;formeditorZoom:1.1;height:40;width:640}
}
##^##*/
