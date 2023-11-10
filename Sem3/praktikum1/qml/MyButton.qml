import QtQuick

Rectangle{
    id: button
    property string name
    signal clicked()
    height: 50
    width: 100
    radius: 25
    color: "blue"
    Behavior on scale{NumberAnimation {duration:200}}

    Text {
        id: buttonText
        anchors.centerIn: parent
        text: qsTr(name)
    }
    MouseArea{
        anchors.fill:button
        onClicked:{
            button.state === "on"?button.state="off":button.state = "on"
            console.log(parent.name + " clicked " + parent.state)
        }
    }

    states:[
        State{
            name:"on"
            PropertyChanges {target:button;color:"red";scale:0.9}
        },
        State{
            name:"off"
            PropertyChanges {target:button;color:"blue";scale:1}
        },
        State{
            name:"disabled"
            PropertyChanges {target:button;color:"grey";scale:0.9}
        }

    ]
}
