import QtQuick 2.0

Item {
    anchors.fill: parent
    id: choosebutton
    property string text2: ""
    property string text1: ""

    Rectangle {
        id: button1
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        color: "black"
        width: 150
        height: 100
        radius: width/4
        Text {
            text: choosebutton.text1
            anchors.centerIn: parent
            font.pointSize: 15
            color: 'white'
            visible: parent
        }
        MouseArea {
            id: touch1
            anchors.fill: parent
            onClicked: {
                choosebutton.hide()
            }
        }
    }
    Rectangle {
        id: button2
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        color: "black"
        width: 150
        height: 100
        radius: width/4
        Text {
            text: choosebutton.text2
            anchors.centerIn: parent
            font.pointSize: 15
            color: "white"
            visible: parent
        }
    }
    function hide() {
        button1.visible = false
        button2.visible = false
    }
}
