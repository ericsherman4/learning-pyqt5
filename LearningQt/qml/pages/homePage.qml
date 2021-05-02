import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    Rectangle {
        id: rectangle
        color: "#55aaff"
        anchors.fill: parent

        Rectangle {
            id: contentContainer
            visible: true
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 45
            anchors.leftMargin: 45
            anchors.bottomMargin: 35
            anchors.topMargin: 35

            property int radius1 : 8
            property int radius2 : 10

            Rectangle {
                id: interactiveBar
                height: 80
                opacity: 1
                visible: true
                color: "#4f7db2"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                radius: contentContainer.radius1

                CustomTextField {
                    id: customTextField
                    width: interactiveBar.width * 0.65 //button and toggle switch should be fixed, this should take up whatever is left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.verticalCenterOffset: 0
                    anchors.leftMargin: 10
                    anchors.right: changeNameBtn.left
                    defaultColor: "#315674"
                    anchors.rightMargin: 10
                }

                CustomBtn {
                    id: changeNameBtn
                    width : 150
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: switch1.left
                    colorPressed: "#234a6b"
                    colorHovered: "#4a97df"
                    anchors.rightMargin: 1


                }

                Switch {
                    id: switch1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }



            }

            Rectangle {
                id: textInfo
                visible: true
                color: "#234a6b"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: interactiveBar.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 15
                radius: contentContainer.radius1

                Rectangle {
                    id: toppanel
                    height: 50
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10

                    Label {
                        id: label
                        x: 289
                        color: "#818181"
                        text: qsTr("Welcome")
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        layer.smooth: false
                        anchors.topMargin: 0
                        font.pointSize: 14
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Label {
                        id: label1
                        x: 282
                        color: "#55aaff"
                        text: qsTr("Date")
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.topMargin: 25
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: bottompanel
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: toppanel.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 5

                    ScrollView {
                        id: scrollView
                        anchors.fill: parent
                        clip: true

                        Text {
                            id: text1
                            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">hi<br />my </p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">name</p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">is </p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">bob</p></body></html>"
                            anchors.fill: parent
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                            textFormat: Text.RichText
                        }
                    }
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.1;height:480;width:800}D{i:3}D{i:9}D{i:10}D{i:8}
D{i:13}D{i:12}D{i:11}D{i:2}D{i:1}
}
##^##*/
