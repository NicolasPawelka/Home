import QtQuick

Rectangle {
    id: content

    width: root.width
    height: 200
    border.width: 2
    state: "NOTPRESSED"
    property var uName: modelData.name
    property var uPassword: modelData.password
    property var uCredit: modelData.credit
    property var uToPay: modelData.to_pay
    property var uKaffee: modelData.kaffee
    property bool selectable:true
    property var iconColor: ["00acc1","1e88e5","5e35b1","6d4c41","7cb342","8e24aa","039be5","43a047","546e7a","00897b","3949ab","757575","c0ca33","d81b60","e53935","f4511e","fb8c00","fdd835","ffb300"]

    border.color: "lightsteelblue"
    color: "#deb887"
    radius: 10
    clip: true

    Row{
        anchors.fill: parent
        anchors.margins: 5
        spacing: 20

        Image{
            id: image
            property int num : Math.floor(Math.random() * 19)
            property int rotRand : Math.floor(Math.random() * 360)
            source: "https://api.dicebear.com/5.x/identicon/svg?rowColor="+iconColor[num]+"&seed="+uName+"&size=96&rotate="+rotRand+"&backgroundColor=deb887"
            height: 190
            width: 190
        }

        Column{
            id: column
            objectName: modelData.name
            Text{ text: "Name: "             + modelData.name ;font.pixelSize: 20    }
            Text{ text: "zu Bezahlen: "      + modelData.to_pay;font.pixelSize: 20  }
            Text{ text: "Anzahl der Kaffe: " + modelData.kaffee;font.pixelSize: 20}
            Text{text:"Konto "               + modelData.credit;font.pixelSize: 20}
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(selectable === false){
                return;
            }
            if(content.state === "NOTPRESSED"){
                content.state = "PRESSED"
            }
            else if(content.state === "PRESSED"){
                content.state = "NOTPRESSED"
            }
        }
    }

    states: [
        State{
            id: pressed
            name:  "PRESSED"
            PropertyChanges {target: content; scale: 0.95; opacity: 0.8}
        },
        State {
            id: released
            name: "NOTPRESSED"
            PropertyChanges {target: content; scale:  1}
        }
    ]

    transitions: [
        Transition {
            from: "NOTPRESSED"; to: "PRESSED"
            NumberAnimation {properties: "scale"; duration: 200}
        },
        Transition{
            from: "PRESSED"; to: "NOTPRESSED"
            NumberAnimation{properties: "scale"; duration: 200}
        }
    ]
}
