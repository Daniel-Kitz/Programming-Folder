import QtQuick 2.0

Item {
    Rectangle {
        id: button1
        color:"black"
        width: 150
        height: 100
        anchors.bottom: mainWin.contentItem.bottom
        anchors.right: mainWin.contentItem.right
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        visible: false
        Text {
            id:button1text
            color: "white"
            anchors.centerIn: parent
            font.pointSize: 20
            text: "no."
        }

        MouseArea {
            id: touch1
            anchors.fill: parent
            enabled: false
            onClicked: {
                menuid2.visible = false
                menuid2button.visible = false
                menuid2button2.visible = false
                menuid2.story = false
            }
        }
    }
    Rectangle {
        id: button2
        color:"black"
        width: 150
        height: 100
        anchors.bottom: main.mainWin.contentItem.bottom
        anchors.right: main.mainWin.contentItem.right
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        visible: false
        Text {
            id: button2text
            color: "white"
            anchors.centerIn: parent
            font.pointSize: 20
            text: "no."
        }

        MouseArea {
            id: touch2
            anchors.fill: parent
            enabled: false
            onClicked: {
                menuid2.visible = false
                menuid2button.visible = false
                menuid2button2.visible = false
                menuid2.story = false
            }
        }
    }

    }

