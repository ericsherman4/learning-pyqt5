import QtQuick 2.15
import QtQuick.Window 2.15

import "qml/controls" //importing my custom QML code, will recognize all qml files in this folder

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    //this is the custom button I made. notice how it goes after the file name.
    CustomBtn {
        text: "Custom Btn"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter


    }
}
