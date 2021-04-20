import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: customBtn
    text: qsTr("Custom Btn")

    //CUSTOM PROPERTIES
    //when you make custom things and then go back over to the main.qml file and open it up in the designer. these properties will now appear and
    //you can edit the colors below directly.
    property color colorDefault: "#0492c9"
    property color colorMouseOver: "#cccccc"
    property color colorPressed: "#555555"

    // this is an object, it has a member variable.
    QtObject{
        id: internal

        //explaining this a bit:
        //case: mouse is not over it
            //enters else and then because the mouse is not hovered over the button, it sets dynamic color to colorDefault
        //case: mouse over it, not pressed down
            //enters else again, but custonBtn.hovered is true, so it psses colorMouseOver to dynamiccolor
        //case: mouse over it and pressed down
            //enters the first clause because mouse is pressed. passes colorPressed because customBtn.down is true
//        property var dynamicColor: if(customBtn.down){
//                                       customBtn.down ? colorPressed : colorDefault
//                                   } else {
//                                       customBtn.hovered ? colorMouseOver : colorDefault
//                                   }
        //this works too
        property var dynamicColor: if(customBtn.down){
                                       colorPressed
                                   } else {
                                       customBtn.hovered ? colorMouseOver : colorDefault
                                   }

    }

    implicitWidth: 200 //this means predefined width, when you instantiate this, it will by default have these values
    implicitHeight: 40 //this means predefined height

    //Set the background by creating a retangle and setting the color of it
    background: Rectangle{
        color: internal.dynamicColor //adding our qt object here but we are setting the color to equal the varible dynamic color!!
        radius: 10 //adds rounded corners to the button
    }


    contentItem: Item {
        id: item1
        Text {
            id: textBtn
            text: customBtn.text  //this is how you get the value from a different object.
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
        }
    }

}
