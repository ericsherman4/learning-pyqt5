import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#55aaff"
        anchors.fill: parent

        Label {
            id: label
            color: "#ffffff"
            text: qsTr("Settings Page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
