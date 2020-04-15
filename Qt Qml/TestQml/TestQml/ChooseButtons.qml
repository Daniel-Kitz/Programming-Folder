import QtQuick 2.0

Item {
    FontLoader {
        id: raleway
        source: "qrc:/fonts/IBM_Plex_Mono/Raleway-Thin.ttf"
    }
    anchors.fill: parent
    id: choosebutton
    property string text2: ""
    property string text1: ""
    property int check: 0
    property bool used: true
    property var b1: button1
    property var b2 : button2

    Rectangle {
        id: button1
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        color: "transparent"
        width: 150
        height: 100
        border.width: 1.5
        border.color: "lightgrey"
//        radius: width/4
        Text {
            text: choosebutton.text1
            anchors.centerIn: parent
            font.pointSize: 15
            font.family: "raleway"
            color: 'black'
            visible: parent
        }
    }
    Rectangle {
        id: button2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        color: "transparent"
        width: 150
        height: 100
        border.width: 1.5
        border.color: "lightgrey"
        Text {
            text: choosebutton.text2
            anchors.centerIn: parent
            font.pointSize: 15
            color: "black"
            visible: parent
            font.family: "raleway"
        }
    }
    function hide() {
        button1.visible = false
        button2.visible = false
    }
}
