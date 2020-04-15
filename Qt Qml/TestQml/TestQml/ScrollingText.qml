import QtQuick 2.0
import QtMultimedia 5.9

Item {
    FontLoader {
        id: raleway
        source: "qrc:/fonts/IBM_Plex_Mono/Raleway-Thin.ttf"
    }
    id: scrollingtext
    anchors.fill: parent
    property string text: ""
    property int charcnt: 0
    property int inter: 100
    signal end
    Text {
        wrapMode: Text.WordWrap
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.margins: 10
        font.pointSize: 15
        font.family: "raleway"
        text: scrollingtext.text.substring(0,scrollingtext.charcnt)
    }
    Timer {
        id: textspeed
        interval: scrollingtext.inter
        repeat: true
        running: false
        onTriggered: {
            scrollingtext.scrolltext()
        }
    }
    function scrolltext() {
        scrollingtext.charcnt = (scrollingtext.charcnt < scrollingtext.text.length) ? ++scrollingtext.charcnt : 0;
        if (scrollingtext.charcnt === scrollingtext.text.length) {
            textspeed.running = false
            scrollingtext.end()
        }
    }
    function show() {
        textspeed.running = true
        scrollingtext.charcnt = 0
    }
    function hide() {
        scrollingtext.charcnt = 0
    }
}
/*    Rectangle {
        id: teyt
        property string fulltext: "this is a test"
        property int charCnt: 0
        Text{
            id: textText
            text: teyt.fulltext.substring(0,teyt.charCnt)
        }
        Timer{
            id: textSpeed
            interval: 200
            repeat: true
            running: true
            onTriggered:{
                teyt.charCnt = (teyt.charCnt<teyt.fulltext.length) ? ++teyt.charCnt : teyt.textspeedtest();
            }
        }
        function textspeedtest() {
            if (teyt.charCnt === teyt.fulltext.length) {
                textSpeed.running = false
                textText.text = "this is a test"
            }*/

   //     }
   // }

