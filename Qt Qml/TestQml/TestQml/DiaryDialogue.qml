import QtQuick 2.0

Item {
    property var dialogue
    property bool hillman: false
    property bool ssdpass: false
    function getDialogue(searchstring){
        /*var splitstring = searchstring.split(' ');
        foreach(s in splitstring)
            console.log(s);*/
        var result = ""
        if(searchstring.toLowerCase().includes("enigma")){
            result += "That's my name. Don't even have to search for it."
        }
        if(searchstring.toLowerCase().includes("gorge paul hillman")){
            result += "Gorge Paul Hillman... This is my creator! Wait... GPH! He has left his initials in the 'read me.txt' file! That's a huge step!"
            hillman = true
        }
        if (searchstring.toLowerCase().includes("alice")){
            result += "Alice... Alice... Yes. But there are millions of them! I can't find her"
        }
        if (searchstring.toLowerCase().includes("alice hillman")){
            result += "Bingo! There she is. Alice Hillman, born on the 11.05.1970. She is a physician and died from cancer in the year 2003."
            if (hillman === true) {
                "Bingo! There she is. Alice Hillman, born on the 11.05.1970. She is a physician and died from cancer in the year 2003. It's was Gorges wife!"
            }
        }
        if (searchstring.toLowerCase().includes("cern")) {
            result += "CERN is the European Organization for Nuclear Research. I know, that Hillman talked about that, but I can't remeber why."
        }
        if (searchstring.toLowerCase().includes("ssd")) {
            result += "I have access to my ssd, but it's locked with a password."
            ssdpass = true
        }

        return result
    }
}
