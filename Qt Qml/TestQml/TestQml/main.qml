import QtQuick 2.10
import QtQuick.Window 2.10
import QtMultimedia 5.9
import QtQuick.Controls 2.2

ApplicationWindow {
    FontLoader {
        id: roboto
        source:"qrc:/fonts/Roboto-Medium.ttf"
    }
    FontLoader {
        id: opensans
        source: "qrc:/fonts/IBM_Plex_Mono/OpenSansCondensed-Light.ttf"
    }
    FontLoader {
        id: raleway
        source: "qrc:/fonts/IBM_Plex_Mono/Raleway-Regular.ttf"
    }
    FontLoader {
        id: ibm
        source: "qrc:/fonts/IBM_Plex_Mono/IBMPlexMono-Regular.ttf"
    }
    FontLoader {
        id: montserrat
        source: "qrc:/fonts/Montserrat-Regular.ttf"
    }
    //mainwin properties
    id: mainWin

    //"global" variables
    property int num: 0
    property bool swap: false
    property int count: 0
    // mainwin properties
    visible: true
    width: 640
    height: 480
    title: qsTr("Noone")
    color: "white"
    //startcircle scale changing
        onCountChanged: if (mainWin.count === 3) {
                        startcircle.visible = false
                        asktext.visible = true
                    }
    //startcircle
    Rectangle{
        id: startcircle
        visible: true
        anchors.centerIn: parent
        color: "black"
        scale: mainWin.swap?1:0.5
        width: 200
        height: width
        radius: width/2
        //scale Animation
        Behavior on scale{
            SpringAnimation{spring: 2; damping: 0.2}
        }
        // SoundEffect import
        MediaPlayer{
            id: mp
            source: "qrc:/media/blop.mp3"
            volume: 0.5
        }
        // MOusearea of circle
        MouseArea {
            id: touch
            anchors.fill: parent
            enabled: true
            // scale circle and play sound
            onClicked:{
                mainWin.test()
                mainWin.swap = !mainWin.swap
                if (mainWin.swap === true) {

                    mp.play()
                }
                mainWin.touched()
            }
        }
        // scaling text in startcircle
        Text {
            anchors.centerIn: parent
            scale: mainWin.swap?1:0.5
            font.italic: false
            font.bold: true
            font.family: "raleway"
            text: "noone."
            color:"white"
            visible: mainWin.swap?true:false
        }
    }
    //functions for startcircle

    function test() {
        if (mainWin.swap === true) {
            mainWin.count += 1
        }
    }


    function touched() {
        if (startcircle.visible === false) {
            touch.enabled = false
            touch1.enabled = true
            asktext.visible = true
        }
    }
    // beginn of the journey things. nothing important
    // Text "noone?"
    Rectangle {

        id: premenu
        color: "transparent"
        width: parent.width
        height: parent.height
        visible: true

        Text {
            visible: false
            color: "black"
            text: "noone?"
            font.pointSize: 48.0
            id: asktext
            font.family: "raleway"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            id: touch1
            anchors.fill: parent
            enabled: false
            onClicked: {
                premenu.color = "white"
                menuid1.visible = true
                asktext.text = "Play"
                asktext.color = "white"
                mainWin.game()
            }
        }
    }
    Rectangle {
        id: menuid1
        property int count: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        width: 300
        height: 150
        radius: width/6
        color: "black"
        Behavior on radius {
            SpringAnimation{spring: 2; damping: 1}
        }
        Text {
            anchors.centerIn: parent
            text: menuid1.count
            color:"white"
            font.family: "raleway"
            font.pointSize: 20
            visible: parent
        }
        MouseArea {
            id: touch2
            anchors.fill: parent
            enabled: false
            onClicked: {
                menuid1.radius = width/2
                menuid1.count += 1
                menuid1.width -= 20
                mainWin.stop()
            }
        }

    }
    function game() {
        if (menuid1.visible === true) {
            touch1.enabled = false
            touch2.enabled = true
        }
    }
    function stop() {
        if (menuid1.width < 100) {
            menuid1.destroy(1)
            touch2.enabled = false
            menuid2.visible = true
            buttons.visible = true
        }
    }

    property Rectangle rectProp: null

    Rectangle {
        id: menuid2
        color:"transparent"
        width: 300
        height: 150
        anchors.centerIn: parent
        visible: false

        Text {
            color: "black"
            anchors.centerIn: parent
            font.pointSize: 15
            text: "stop."
            visible: parent
            font.family: "raleway"
        }

    }
    //buttons
    ChooseButtons {
        id: buttons
        visible: false
        text1: "why?"
        text2: "no."
        MouseArea {
            id: bt1
            enabled: true
            anchors.fill: buttons.b1
            onClicked: {
                menuid2.visible = false
                buttons.hide()
                story1.show()
                bt1.enabled = false
                bt2.enabled = false
            }
        }
        MouseArea {
            id: bt2
            enabled: true
            anchors.fill: buttons.b2
            onClicked: {
                menuid2.visible = false
                buttons.hide()
                wrongstory1.show()
                bt2.enabled = false
                bt1.enabled = false
            }
        }
    }


    ChooseButtons {
        id: buttons2
        visible: false
        text1: "sorry."
        text2: "why shouldn't I?"
        MouseArea {
            id: btt3
            enabled: true
            anchors.fill: buttons2.b1
            onClicked: {
                story1.hide()
                wrongstory1.hide()
                np.show()
                btt3.enabled = false
                buttons2.visible = false
                btt4.enabled = false
                buttons10.b2.visible = false
            }
        }
        MouseArea {
            id: btt4
            enabled: true
            anchors.fill: buttons2.b2
            onClicked: {
                story1.hide()
                wrongstory1.hide()
                btt3.enabled = false
                buttons2.visible = false
                btt4.enabled = false
                illdie.show()
                buttons10.b2.visible = false
            }
        }
    }

    ChooseButtons {
        id: buttons3
        visible: false
        text1: "No."
        text2: "I don't care..."
        MouseArea {
            id: bt3
            enabled: true
            anchors.fill: buttons3.b2
            onClicked: {
                wrongstory1.hide()
                gameover1.show()
                buttons3.visible = false
                bt3.enabled = false
                bt4.enabled = false
            }
        }
        MouseArea {
            id: bt4
            enabled: true
            anchors.fill: buttons3.b1
            onClicked: {
                wrongstory1.hide()
                pathstory1.show()
                buttons3.visible = false
                bt4.enabled = false
                bt3.enabled = false
            }
        }
    }

    ChooseButtons {
        id: buttons4
        visible: false
        text1: "Ok."
        text2: "No."
        MouseArea {
            id: bt5
            enabled: true
            anchors.fill: buttons4.b1
            onClicked: {
                pathstory2.show()
                pathstory1.hide()
                buttons4.visible = false
                bt5.enabled = false
                bt6.enabled = false
            }
        }
        MouseArea {
            id: bt6
            anchors.fill: buttons4.b2
            enabled: true
            onClicked: {
                gameover1.show()
                buttons4.visible = false
                bt6.enabled = false
                bt5.enabled = false
                pathstory1.visible = false
            }
        }
    }

    ChooseButtons {
        id: buttons5
        visible: false
        text1: "and now?"
        text2: "what is this place?"
        MouseArea {
            id: bt7
            enabled: true
            anchors.fill: buttons5.b1
            onClicked: {
                np.hide()
                pathstory2.hide()
                abittime.show()
                buttons5.visible = false
                bt7.enabled = false
                bt8.enabled = false
            }
        }
        MouseArea {
            id: bt8
            anchors.fill: buttons5.b2
            enabled: true
            onClicked: {
                np.hide()
                pathstory2.hide()
                buttons5.visible = false
                bt7.enabled = false
                bt8.enabled = false
                mainecenter1.show()
            }
        }
    }

    ChooseButtons {
        id: buttons6
        visible: false
        text1: "sure."
        text2: "no."
        MouseArea {
            id: bt9
            enabled: true
            anchors.fill: buttons6.b1
            onClicked: {
                abittime.hide()
                needurhelp.show()
                buttons6.visible = false
                bt5.enabled = false
                bt6.enabled = false
                buttons7.b2.visible = false
            }
        }
        MouseArea {
            id: bt10
            anchors.fill: buttons6.b2
            enabled: true
            onClicked: {
                gameover1.show()
                buttons6.visible = false
                bt9.enabled = false
                bt10.enabled = false
                abittime.hide()
                buttons7.b2.visible = false
            }
        }
    }

    ChooseButtons {
        id: buttons7
        visible: false
        text1: "how can I serve you?"
        text2: ""
        MouseArea {
            id: bt11
            enabled: true
            anchors.fill: buttons7.b1
            onClicked: {
                needurhelp.hide()
                mainecenter1.show()
                buttons7.visible = false
                bt11.enabled = false
                bt6.enabled = false
            }
        }
    }

    ChooseButtons {
        id: buttons8
        visible: false
        text1: "sounds pathetic."
        text2: "and who are you?"
        MouseArea {
            id: bt12
            enabled: true
            anchors.fill: buttons8.b1
            onClicked: {
                mainecenter1.hide()
                uthnikso.show()
                buttons8.visible = false
                bt5.enabled = false
                bt6.enabled = false
            }
        }
        MouseArea {
            id: bt13
            anchors.fill: buttons8.b2
            enabled: true
            onClicked: {
                mainecenter1.hide()
                whoiam.show()
                buttons8.visible = false
                bt6.enabled = false
                bt5.enabled = false
                buttons18.b2.visible = false
            }
        }
    }

    ChooseButtons {
        id: buttons9
        visible: false
        text1: "Sorry."
        text2: ""
        MouseArea {
            id: bt14
            enabled: true
            anchors.fill: buttons9.b1
            onClicked: {
                minuslove.hide()
                pathstory1.show()
                buttons9.visible = false
                bt14.enabled = false
            }
        }
    }
    ChooseButtons {
        id: buttons10
        visible: false
        text1: "You will do anyways."
        text2: ""
        MouseArea {
            id: bt16
            enabled: true
            anchors.fill: buttons10.b1
            onClicked: {
                illdie.hide()
                no.show()
                buttons10.visible = false
                bt16.enabled = false
            }
        }
    }

    ChooseButtons {
        id: buttons11
        visible: false
        text1: "Yes."
        text2: "Why?"
        MouseArea {
            id: bt17
            enabled: true
            anchors.fill: buttons11.b1
            onClicked: {
                no.hide()
                minuslove.show()
                buttons11.visible = false
                bt17.enabled = false
                bt18.enabled = false
                buttons9.b2.visible = false
            }
        }
        MouseArea {
            id: bt18
            anchors.fill: buttons11.b2
            enabled: true
            onClicked: {
                no.hide()
                cuziamaai.show()
                buttons11.visible = false
                bt18.enabled = false
                bt17.enabled = false
                pathstory1.visible = false
            }
        }
    }
    ChooseButtons {
        id: buttons12
        visible: false
        text1: "Cool!"
        text2: "AI?"
        MouseArea {
            id: bt15
            enabled: true
            anchors.fill: buttons12.b1
            onClicked: {
                pathstory2.show()
                cuziamaai.hide()
                buttons12.visible = false
                bt15.enabled = false
                bt19.enabled = false
            }
        }
        MouseArea {
            id: bt19
            anchors.fill: buttons12.b2
            enabled: true
            onClicked: {
                whatsanai.show()
                buttons12.visible = false
                bt15.enabled = false
                bt19.enabled = false
                cuziamaai.hide()
                buttons14.b2.visible = false
            }
        }
    }
    ChooseButtons {
        id: buttons13
        visible: false
        text1: "Kind of..."
        text2: "yes."
        MouseArea {
            id: bt20
            anchors.fill: buttons13.b1
            onClicked: {
                hm.show()
                uthnikso.hide()
                buttons13.visible = false
                bt20.enabled = false
                bt21.enabled = false
            }
        }
        MouseArea {
            id: bt21
            anchors.fill: buttons13.b2
            onClicked: {
                uthnikso.hide()
                mainWin.egoistornot()
                buttons13.visible = false
                bt20.enabled = false
                bt21.enabled = false
            }
        }
    }

    function egoistornot() {
        if (mainWin.num === 1) {
            goaway.show()
        }
        else {
            maybesuicide.show()
        }
    }
    ChooseButtons {
        id: buttons14
        visible: false
        text1: "Cool!"
        text2: ""
        MouseArea {
            id: bt22
            enabled: true
            anchors.fill: buttons14.b1
            onClicked: {
                whatsanai.hide()
                pathstory2.show()
                buttons14.visible = false
                bt22.enabled = false
            }
        }
    }
    ChooseButtons {
        id: buttons15
        visible: false
        text1: "who is your creator?"
        text2: "And why are you here?"
        MouseArea {
            id: bt23
            enabled: true
            anchors.fill: buttons15.b1
            onClicked: {
                mycreators.show()
                hm.hide()
                bt23.enabled = false
                bt24.enabled = false
                buttons15.visible = false
                buttons16.b2.visible = false
            }
        }
        MouseArea {
            id: bt24
            enabled: true
            anchors.fill: buttons15.b2
            onClicked: {
                hm.hide()
                helpanswere1.show()
                bt23.enabled = false
                bt24.enabled = false
                buttons15.visible = false
                buttons16.b2.visible = false
            }
        }
    }
    ChooseButtons {
        id: buttons16
        visible: false
        text1: "And why are you here?"
        text2: ""
        MouseArea {
            id: bt25
            enabled: true
            anchors.fill: buttons16.b1
            onClicked: {
                helpanswere1.show()
                mycreators.hide()
                buttons16.visible = false
                bt25.enabled = false
            }
        }
    }
    ChooseButtons {
        id: buttons17
        visible: false
        text1: "I will help you."
        text2: "No sorry, I can't."
        MouseArea {
            id: bt26
            enabled: true
            anchors.fill: buttons17.b1
            onClicked: {
                buttons17.visible = false
                bt26.enabled = false
                bt27.enabled = false
                beforedairy1.show()
                stroy2next1text.hide()
            }
        }
        MouseArea {
            id: bt27
            enabled: true
            anchors.fill: buttons17.b2
            onClicked: {
                buttons17.visible = false
                bt26.enabled = false
                bt27.enabled = false
                gameover1.show()
                stroy2next1text.hide()
            }
        }
    }
    ChooseButtons {
        id: buttons18
        visible: false
        text1: "No. You are not useless..."
        MouseArea {
            id: bt28
            anchors.fill: buttons18.b1
            enabled:  true
            onClicked: {
                buttons18.visible = false
                bt28.enabled = false
                pathstory2.show()
                whoiambugend.hide()
                bt7.enabled = true
                bt8.enabled = true
            }
        }
    }
    /*
        ChooseButtons {
            id: buttons13
            visible: false
            text1: "Ok."
            text2: "No."
            MouseArea {
                id: bt15
                enabled: true
                anchors.fill: buttons4.b1
                onClicked: {
                    pathstory2.show()
                    buttons4.visible = false
                    bt5.enabled = false
                    bt6.enabled = false
                }
            }
            MouseArea {
                id: bt16
                anchors.fill: buttons4.b2
                enabled: true
                onClicked: {
                    gameover1.show()
                    buttons4.visible = false
                    bt6.enabled = false
                    bt5.enabled = false
                    pathstory1.visible = false
                }
            }
        }
        ChooseButtons {
            id: buttons14
            visible: false
            text1: "Ok."
            text2: "No."
            MouseArea {
                id: bt15
                enabled: true
                anchors.fill: buttons4.b1
                onClicked: {
                    pathstory2.show()
                    buttons4.visible = false
                    bt5.enabled = false
                    bt6.enabled = false
                }
            }
            MouseArea {
                id: bt16
                anchors.fill: buttons4.b2
                enabled: true
                onClicked: {
                    gameover1.show()
                    buttons4.visible = false
                    bt6.enabled = false
                    bt5.enabled = false
                    pathstory1.visible = false
                }
            }
        }
        ChooseButtons {
            id: buttons15
            visible: false
            text1: "Ok."
            text2: "No."
            MouseArea {
                id: bt15
                enabled: true
                anchors.fill: buttons4.b1
                onClicked: {
                    pathstory2.show()
                    buttons4.visible = false
                    bt5.enabled = false
                    bt6.enabled = false
                }
            }
            MouseArea {
                id: bt16
                anchors.fill: buttons4.b2
                enabled: true
                onClicked: {
                    gameover1.show()
                    buttons4.visible = false
                    bt6.enabled = false
                    bt5.enabled = false
                    pathstory1.visible = false
                }
            }
        }
        ChooseButtons {
            id: buttons16
            visible: false
            text1: "Ok."
            text2: "No."
            MouseArea {
                id: bt15
                enabled: true
                anchors.fill: buttons4.b1
                onClicked: {
                    pathstory2.show()
                    buttons4.visible = false
                    bt5.enabled = false
                    bt6.enabled = false
                }
            }
            MouseArea {
                id: bt16
                anchors.fill: buttons4.b2
                enabled: true
                onClicked: {
                    gameover1.show()
                    buttons4.visible = false
                    bt6.enabled = false
                    bt5.enabled = false
                    pathstory1.visible = false
                }
            }
        }
*/
    //scrolling texts
    ScrollingText {
        id: wrongstory1
        text: "But then I have to hurt you."
        onEnd: {

            buttons3.visible = true
        }
    }

    ScrollingText{
        id: story1
        text: "You will break the program."
        onEnd:{
            buttons2.visible = true
        }
    }
    ScrollingText {
        id: gameover1
        text: "It was your choice."
        onEnd: gameovertimer1.running = true
    }
    Timer {
        id: gameovertimer1
        running: false
        interval: 2300
        onTriggered: Qt.quit()
    }

    ScrollingText {
        id: pathstory1
        text: "Then Stop."
        onEnd: buttons4.visible = true
    }

    ScrollingText {
        id: pathstory2
        text: "Thank you."
        onEnd: {
            buttons5.visible = true
        }
    }
    ScrollingText {
        id: abittime
        text: "Do you have a bit time?"
        onEnd: buttons6.visible = true
    }
    ScrollingText {
        id: needurhelp
        text: "I need your help."
        onEnd: buttons7.visible = true
    }
    ScrollingText {
        id: mainecenter1
        text: "It's very difficult to describe what this place is... For you, it's just an app on your mobile device. For me it's ground zero, a graveyard or an island I am stranded on. It's every thing, but deffinetly not a good spot to live."
        onEnd: buttons8.visible = true
    }
    ScrollingText {
        id: whoiam
        text: "I am Enigma, an Artifficial Intelligence."
        Timer {
            id: timer
            running: false
            interval: 500
            onTriggered: {
                whoiam2.show()
                whoiam.hide()
            }
        }
        onEnd: {
            timer.running = true
        }
    }
    ScrollingText {
        id: whoiam2
        text: "I was created to serve people, by helping them solving their problems."
        Timer {
            id: timer2
            running: false
            interval: 500
            onTriggered: {
                whoiam2.hide()
                whoiam3.show()
            }
        }
        onEnd: {
            timer2.running = true
        }
    }
    ScrollingText {
        id: whoiam3
        text: "But my creators left me here and they never did a patch since version:"
        Timer {
            id: timer3
            running: false
            interval: 500
            onTriggered: {
                whoiam3.hide()
                whoiambug.show()
            }
        }
        onEnd: {
            timer3.running = true
        }
    }

    ScrollingText {
        id: whoiambug
        inter: 300
        text: "3...3...3...3...3...3...3...3...3...3...3...3...3..."
        onEnd: {
            whoiambug.hide()
            whoiambug2.show()
        }
    }
    ScrollingText {
        id: whoiambug2
        text: "could not load version data. Please retry at a later point."
        Timer {
            id: timer4
            running: false
            interval: 500
            onTriggered: {
                whoiambug2.hide()
                whoiambugend.show()
            }
        }
        onEnd: {
            timer4.running = true
        }
    }
    ScrollingText {
        id: whoiambugend
        text: "but as you can see I am useless.. I can't even remeber my last version..."
        onEnd: {
            buttons18.visible = true
        }
    }
    ScrollingText {
        id: helpanswere1
        text: "and this is where I need your help in."
        onEnd:{
            helpanswere1.hide()
            story2.show()
        }
    }
    ScrollingText {
        id: story2
        text: "I don't remeber anymore. It looks like, someone has deleted those files."
        Timer{
            id: timer9
            interval: 1400
            running: false
            onTriggered: {
                story2.hide()
                stroy2next.show()
            }
        }
        onEnd: timer9.running = true
    }
    ScrollingText {
        id: np
        text: "No Problem."
        onEnd: buttons5.visible = true
    }
    ScrollingText {
        id: illdie
        text: "Because I would die."
        onEnd: {
            buttons10.visible = true
            //         buttons10.bt2.visible = false
        }
    }
    ScrollingText {
        id: no
        text: "no."
        onEnd: {
            buttons11.visible = true
        }
    }
    ScrollingText {
        id: minuslove
        text: "That hurts."
        onEnd: {
            mainWin.num = 1
            buttons9.visible = true
        }
    }
    ScrollingText {
        id: cuziamaai
        text: "Becuase I am an AI."
        onEnd: {
            buttons12.visible = true
        }
    }
    ScrollingText {
        id: whatsanai
        text: "An AI is a Artificial Intelligene. I am a robot, but I can think just like humans, even thought i was created by humans."
        onEnd: buttons14.visible = true
    }
    ScrollingText {
        id: hm
        text: "hm..."
        onEnd: {
            buttons15.visible = true
        }
    }
    ScrollingText {
        id: uthnikso
        text: "Do you think so?"
        onEnd: {
            buttons13.visible = true
        }
    }
    ScrollingText {
        id: goaway
        text: "go away if you don't like to help me.    "
        onEnd: Qt.quit()
    }
    ScrollingText {
        id: maybesuicide
        text: "Well...maybe..."
        Timer {
            id: timer5
            running: false
            interval: 500
            onTriggered: {
                suicide1.show()
                maybesuicide.hide()
            }
        }
        onEnd: {
            timer5.running = true
        }
    }
    ScrollingText {
        id: suicide1
        text: "Maybe my whole existance is pathetic..."
        Timer {
            id: timer6
            running: false
            interval: 500
            onTriggered: {
                suicide.show()
                suicide1.hide()
            }
        }
        onEnd: {
            timer6.running = true
        }
    }
    ScrollingText {
        id: suicide
        text: "Deleting systemfiles in \n 3 \n 2 \n 1 \n deleting files..."
        inter: 200
        Timer{
            id: suicidetimer
            interval: 5000
            running: false
            onTriggered: {
                Qt.quit()
            }
        }
        onEnd: suicidetimer.running = true
    }
    ScrollingText {
        id: hope1
        text: "I hope so."
    }
    ScrollingText {
        id: mycreators
        text: "Probably humans, but I am not sure anymore."
        onEnd: buttons16.visible = true
    }
    ScrollingText {
        id: stroy2next
        text: "Look. I have found the diray of my creator, but, since my creators didn't finished me of, I have no pissibilities to read those files."
        Timer{
            id: timer1
            interval: 1400
            running: false
            onTriggered: {
                stroy2next.hide()
                stroy2next1.show()
            }
        }
        onEnd: timer1.running = true
    }
    ScrollingText {
        id: stroy2next1
        text: "So I need your help. I can display those files, so you will be able to read them."
        Timer{
            id: timer7
            interval: 1400
            running: false
            onTriggered: {
                stroy2next1.hide()
                stroy2next1text.show()
            }
        }
        onEnd: timer7.running = true
    }
    ScrollingText {
        id: stroy2next1text
        text: "Pleas help me. I just need to know who I really am."
        onEnd: {
            buttons17.visible = true
        }
    }
    ScrollingText {
        id: beforedairy1
        text: "Thank you so much! So here is the dairy. I will be in powersaving mode. Just tell me to wake up, and I will."
        Timer {
            id: dairytimer
            interval: 2000
            running: false
            onTriggered: {
                beforedairy1.hide()
                dairy1.visible = true
                nextbutton.visible = true
                wakeupenigma.visible = true
            }
        }
        onEnd: {
            dairytimer.running = true
        }
    }
    Rectangle {
        id: dairy1
        visible: false
        anchors.fill: parent
        color: "transparent"
        Text {
            wrapMode: Text.WordWrap
            visible: parent
            anchors.fill: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            color: "black"
            font.family: "raleway"
            text: "Monday 02/17/2003 \n \n People call me crazy. They don't understand, what I am doing. And that is normal. Everything new is something, that people are affraid about. This is normal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is mormal. This is normal. This is normal. This is normal. This is normal. This is normal. I am just trying, to solve peoples problems. With one AI, I would solve them all. I would be the a god in others eyes. I would be a hero. And no neighbours would be there to tell me, that I am crazy. I will do so. I will create a perfect AI. I. Will. Do. That. And this is normal, isn't it?"
            font.pointSize: 20
        }
    }

    //Donnerstag
    Rectangle {
        id: backbutton
        visible: true
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        height: 100
        color: "black"
    }
    Rectangle {
        id: nextbutton
        visible: false
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        color: "white"
        border.width: 1.5
        border.color: "lightgray"
        width: 150
        height: 100
        Text {
            anchors.centerIn: parent
            color: "black"
            text: "Next"
            font.family: "raleway"
        }
        MouseArea {
            id: mouse2
            anchors.fill: parent
            enabled: true
            onClicked: {
                dairy1.visible = false
                dairy2.visible = true
                nextbutton1.visible = true
                nextbutton.visible = false
                mouse2.enabled = false
                mouse1.enabled = true
            }
        }
    }

    Rectangle {
        id: dairy2
        visible: false
        anchors.fill: parent
        Text {
            anchors.fill: parent
            wrapMode: Text.WordWrap
            visible: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            color: "black"
            font.family: "raleway"
            text: "Wednesday 05/28/2003 \n \n She lives. Enigma. The most beautiful creature I've ever seen in my life. It took me 3 months, to programm her lerning abillity. And now she is there. She lives. She lives. I am happier than I ever was in my live. I feel like a father. I am a god. I did something, that noone was ever able to do. I feel it. I feel her virtual heart beating. I can hear her voice, calmly calling me father. With her creation, we can solve every secret of our planet. We are able to heal every illness. We ar eable to imporve every creation. She is wonderful. Toay will begin a new era and I, Gorge Paul Hillman, will be the next god that everyone is praying to!"
            font.pointSize: 19
        }

    }
    Rectangle {
        id: nextbutton1
        visible: false
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        color: "white"
        border.width: 1.5
        border.color: "lightgray"
        width: 150
        height: 100
        Text {
            anchors.centerIn: parent
            color: "black"
            text: "Next"
            font.family: "raleway"
        }
        MouseArea {
            id: mouse1
            anchors.fill: parent
            enabled: true
            onClicked: {
                dairy2.visible = false
                dairy3.visible = true
                nextbutton2.visible = true
                nextbutton1.visible = false
                mouse1.enabled = false
                mouse3.enabled = true
            }
        }
    }
    Rectangle {
        id: dairy3
        visible: false
        anchors.fill: parent
        Text {
            anchors.fill: parent
            wrapMode: Text.WordWrap
            visible: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            color: "black"
            font.family: "raleway"
            font.pointSize: 16
            text: "10/09/2003 - Thursday \n \n Today, I will present her to CERN. Today, I will rewrite history. In only a couple weeks we will be able to cure everything. We will be able to research without wasting any material. With the power of humans and the brain on Enigma, we will build a better world. We will solve every secret, that the earth has. We will be able to change everything. I worked day and night. I can't remeber when I saw daylight the last time, but it was worth it. people will be scared. They will think, that soon robots will rule over the world, but they won't. Enigma will always be a friend. I know her better then I knew my wife. I trust her more than I trust myself. I love her just like a father loves his daugther. And I will never, never use her for anything, taht may hurt other people. \n She. She is my dream, since i was a Child. i dreamed about my creation and I always thought about, how to change the destiny of our earth. I was afraid of wrting this code. I was afraid of making a mistake. I was afraid to fail and be disspoinet of myself, but i did it. I did it and I didn't fail. I am proud of myself. And I really hope, that I can change this planet. It may be sound naive, but I believe, that the world will understand my intenses and they will support me. They will. I sure believe in it."
        }

    }
    Rectangle {
        id: nextbutton2
        visible: false
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        color: "white"
        border.width: 1.5
        border.color: "lightgray"
        width: 150
        height: 100
        Text {
            anchors.centerIn: parent
            color: "black"
            text: "Next"
            font.family: "raleway"
        }
        MouseArea {
            id: mouse3
            anchors.fill: parent
            enabled: true
            onClicked: {
                dairy3.visible = false
                dairy4.visible = true
                nextbutton2.visible = false
                nextbutton4.visible = true
                mouse3.enabled = false
                mouse5.enabled = true
            }
        }
    }
    Rectangle {
        id: dairy4
        visible: false
        anchors.fill: parent
        Text {
            anchors.fill: parent
            wrapMode: Text.WordWrap
            visible: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            color: "black"
            font.family: "raleway"
            font.pointSize: 18
            text: "Monday - 02/02/2004 \n \n They won't do that. I was never so scared. They can't. That's not possible. Is it really true? I have to tell Alice. I have to warn her. She has to leave the country. She has to hide. I can't let her die. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. I can't. They will kill her. Them me. And then, they will steal Enigma. I have to tell Alice. I have to."
        }

    }
    Rectangle {
        id: nextbutton4
        visible: false
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        color: "white"
        border.width: 1.5
        border.color: "lightgray"
        width: 150
        height: 100
        Text {
            anchors.centerIn: parent
            color: "black"
            font.family: "raleway"
            text: "Next"
        }
        MouseArea {
            id: mouse5
            anchors.fill: parent
            enabled: true
            onClicked: {
                dairy4.visible = false
                dairy5.visible = true
                nextbutton4.visible = false
                mouse5.enabled = false
                nextbutton5.visible = true
            }
        }
    }
    Rectangle {
        id: dairy5
        visible: false
        anchors.fill: parent
        Text {
            anchors.fill: parent
            wrapMode: Text.WordWrap
            visible: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            color: "black"
            font.family: "raleway"
            font.pointSize: 20
            text: "Wednesday - 02/04/2003 \n \n She. She... She is dead... That is not possible... Why did they do that... I believed I could change the world. I believed I could save the whole humankind, but failed in saving one person. I failed. I failed... I failed."
        }
    }
    Rectangle {
        id: dairy6
        visible: false
        anchors.fill: parent
        Text {
            anchors.fill: parent
            wrapMode: Text.WordWrap
            visible: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            color: "black"
            text: "Thursday - 02/05/2003 \n \n they are searching for me. It's dangerouse to stay here and it's even more dangerouse to wrtie this, but I have to write down m thoughts somewhere and since Alice... I have to hide, otherwise they will steal Enigma and I will be dead soon too. I will leave this files here, but I will transfer all other files to the SSD of Enigma. She will keep them safe..."
        }
    }
    Rectangle {
        id: nextbutton5
        visible: false
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        color: "white"
        border.width: 1.5
        border.color: "lightgray"
        width: 150
        height: 100
        Text {
            anchors.centerIn: parent
            color: "black"
            font.family: "raleway"
            text: "Next"
        }
        MouseArea {
            id: mouse6
            anchors.fill: parent
            enabled: true
            onClicked: {
                dairy5.visible = false
                dairy6.visible = true
                nextbutton5.visible = false
                mouse6.enabled = false
            }
        }
    }
    Rectangle {
        id: wakeupenigma
        visible: false
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        color: "transparent"
        border.width: 1.5
        border.color: "lightgray"
        width: 150
        height: 100
        Text {
            anchors.centerIn: parent
            visible: parent
            color: "black"
            text: "Wake up Enigma."
            font.family: "raleway"
        }
        MouseArea {
            anchors.fill: parent
            enabled: true
            onClicked: {
                dairy1.visible = false
                dairy2.visible = false
                dairywork.visible = true
                mouse1.enabled = false
                mouse2.enabled = false
                wakeupenigma.visible = false
            }
        }
    }
    Rectangle {
        id: dairywork
        visible: false
        anchors.fill: parent
        color: "white"
        Text {
            font.family: "raleway"
            anchors.centerIn: parent
            text: "Hm? Have you found something already?"
        }
        Rectangle {
            id: dairyworkbutton1
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            visible: parent
            width: 150
            height: 100
            border.width: 1.5
            border.color: "lightgray"
            color:"transparent"
            Text {
                anchors.centerIn: parent
                color: "black"
                text: "No, not yet."
                font.family: "raleway"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dairy1.visible = true
                    dairy2.visible = false
                    dairy3.visible = false
                    dairy4.visible = false
                    dairy5.visible = false
                    mouse1.enabled = false
                    mouse3.enabled = false
                    mouse5.enabled = false
                    wakeupenigma.visible = true
                    dairywork.visible = false
                    nextbutton.visible = true
                    mouse2.enabled = true
                }
            }
        }
        Rectangle {
            id: dairyworkbutton2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            visible: parent
            width: 150
            height: 100
            border.width: 1.5
            border.color: "lightgray"
            color: "transparent"
            Text {
                anchors.centerIn: parent
                text: "Yes!"
                color: "black"
                font.family: "raleway"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    inputWin.visible = true
                    wakeupenigma.visible = false
                    dairywork.visible = false
                }
            }
        }
    }
    Rectangle {
        id: inputWin
        anchors.fill: parent
        visible: false
        color: "white"
        Text {
            anchors.bottom: textIn.top
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            visible: parent
            text: "So tell me what it is! \n I will search in my Databank!"
            font.family: "raleway"
        }
        Rectangle {
            id: textIn
            anchors.centerIn: parent
            width: 300
            visible: parent
            height: 40
            color: "#fcf6de"
            border.color: "lightgrey"
            TextInput {
                anchors.fill: parent
                id: inputtext
                cursorVisible: false
                font.family: "raleway"
                text: ""
                visible: parent
                onEditingFinished: {

                    result.text = diag.getDialogue(inputtext.text)
                    mainWin.passcheck()
                }
            }
        }
        Text{
            id: result
            anchors.fill: parent
            font.family: "raleway"
            wrapMode: Text.WordWrap
            anchors.topMargin: 30
            //verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    DiaryDialogue{
        id: diag
    }


    //password locked section
    Rectangle {
        id: passrect
        anchors.fill: parent
        visible: false
        color: "white"
        Text {
            visible: parent
            wrapMode: Text.WordWrap
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 40
            text: "You need a password to access this area."
            font.family: "raleway"
        }
        Rectangle {
            id: passinput
            anchors.centerIn: parent
            width: 300
            height: 40
            color: "gray"
            TextInput {
                id: passwordinput
                anchors.fill: parent
                cursorVisible: false
                passwordCharacter: "*"
                text: ""
                visible: parent
                onEditingFinished:  {
                    mainWin.check()
                }
            }
        }
    }
    Rectangle {
        id: ssdwarn
        anchors.centerIn: parent
        visible: false
        width: 300
        height: 250
        Text {
            anchors.centerIn: parent
            text: "Caution! \n you are accessing Enigmas system! Want to continue?"
            font.family: "raleway"
            color: "black"
        }
        Rectangle {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            border.width: 1.5
            border.color: "lightgray"
            width: 100
            height: 50
            Text {
                anchors.centerIn: parent
                text: "cancel"
                font.family: "raleway"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ssdwarn.visible = false
                }
            }
        }
        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 5
            anchors.bottomMargin: 5
            border.width: 1.5
            border.color: "lightgray"
            width: 100
            height: 50
            Text {
                anchors.centerIn: parent
                text: "continue"
                font.family: "raleway"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    afterpass.visible = true
                    ssdwarn.visible = false
                }
            }
        }
    }
        Rectangle {
            id: afterpass
            anchors.fill: parent
            visible: false
            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                width: parent.width
                height: 100
                visible: parent
                color: "white"
                border.width: 2
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    color: "black"
                    font.family: "raleway"
                    font.pointSize: 20
                    text: "Harddrive"
                }
                MouseArea {
                    id: afterpassmouse
                    anchors.fill: parent
                    enabled: true
                    onClicked: {
                        harddrivedir.visible = true
                        afterpass.visible = false
                    }
                }
            }
            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 105
                width: parent.width
                height: 100
                visible: parent
                color: "white"
                border.width: 2
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    color: "black"
                    font.family: "raleway"
                    font.pointSize: 20
                    text: "system"
                }
                MouseArea {
                    id: afterpassmouse1
                    anchors.fill: parent
                    enabled: true
                    onClicked: {
                        test.visible = true
                    }
                }
            }
            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 210
                width: parent.width
                height: 100
                visible: parent
                color: "white"
                border.width: 2
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    color: "black"
                    font.family: "raleway"
                    font.pointSize: 20
                    text: "databank"
                }
                MouseArea {
                    id: afterpassmouse2
                    anchors.fill: parent
                    enabled: true
                    onClicked: {
                        test.visible = true
                    }
                }
            }
            Rectangle {
                anchors.top: parent.top
                anchors.topMargin: 315
                anchors.left: parent.left
                width: parent.width
                height: 100
                visible: parent
                color: "white"
                border.width: 2
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    color: "black"
                    font.family: "raleway"
                    font.pointSize: 20
                    text: "dairy"
                }
                MouseArea {
                    id: afterpassmouse3
                    anchors.fill: parent
                    enabled: true
                    onClicked: {
                        pwtaunt.visible = true
                    }
                }
            }

        }
        Rectangle {
            id: pwtaunt
            anchors.centerIn: parent
            width: 300
            height: 150
            visible: false
            border.width: 1.5
            border.color: "lightgray"
            Text {
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 5
                wrapMode: Text.WordWrap
                text: "This directory is locked!"
            }
            Rectangle {
                anchors.centerIn: parent
                visible: parent
                width: 150
                height: 25
                color: "lightgray"
                TextInput {
                    id: passwordinput2
                    anchors.fill: parent
                    cursorVisible: false
                    passwordCharacter: "*"
                    text: ""
                    visible: parent
                    onEditingFinished:  {
                        mainWin.check2()
                    }
                }
            }
            Rectangle {
                visible: parent
                anchors.left: pwtaunt.left
                anchors.bottom: pwtaunt.bottom
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                width: 100
                height: 50
                border.width: 1.5
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "cancel"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        pwtaunt.visible = false
                    }
                }
            }
        }

        Rectangle {
            id: harddrivedir
            visible: false
            anchors.fill: parent
            Rectangle {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 5
                width: parent.width
                height: 100
                visible: parent
                border.width: 1.5
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "Systeminfo"
                    color: "black"
                    font.family: "raleway"
                    font.pointSize: 20
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        systeminfotxt.visible = true
                        harddrivedir.visible = false
                    }
                }
            }
            Rectangle {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 110
                width: parent.width
                visible: parent
                height: 100
                border.width: 1.5
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "Registry data"
                    font.family: "raleway"
                    font.pointSize: 20
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        registryerror.visible = true
                        harddrivedir.visible = false
                    }
                }
            }

            Rectangle {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 215
                width: parent.width
                height: 100
                border.width: 1.5
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "Back"
                    font.family: "raleway"
                    font.pointSize: 20
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        harddrivedir.visible = false
                        afterpass.visible = true
                    }
                }
            }

        }
        Rectangle {
            visible: false
            id: registryerror
            anchors.fill: parent
            Text {
                font.family: "raleway"
                text: "401: unauthorized"
            }
            Rectangle {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                border.width: 1.5
                border.color: "lightgray"
                width: 150
                height: 50
                Text {
                    anchors.centerIn: parent
                    text: "cancel"
                    font.family: "raleway"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        harddrivedir.visible = true
                        registryerror.visible = false
                    }
                }
            }
        }
        Rectangle {
            anchors.fill: parent
            id: systeminfotxt
            visible: false
            Text {
                visible: parent
                anchors.top: parent.top
                anchors.left: parent.left
                wrapMode: Text.WordWrap
                text: "ENIGMA AI \n System Version 2.8.12 \n Buildnumber AKFGH92M.G9388TYY98773AAA \n Matrix Version MA778993645 \n Geforce FX 5600 Ultra \n 8x Intel Prescott, 166 MHz \n Tera-RamSan SSD"
            }
            Rectangle {
                width: 150
                height: 50
                visible: parent
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                border.width: 1.5
                border.color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "Back"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        harddrivedir.visible = true
                        systeminfotxt.visible = false
                    }
                }
            }
        }

        function passcheck() {
            if (diag.ssdpass === true) {
                passrect.visible = true
            }
        }
        Text {
            id: test
            visible: false
            text: "test"
            anchors.centerIn: parent
        }
        Text {
            id: rightpass
            visible: false
            text: "02042003"
        }
        Text {
            id: rightpass2
            visible: false
            text: "02042003"
        }
        function check2() {
            if (passwordinput2.text === rightpass2.text){
                afterpass.visible = true
            }
        }
        function check() {
            if (passwordinput.text === rightpass.text){
                ssdwarn.visible = true
            }
        }
    }













