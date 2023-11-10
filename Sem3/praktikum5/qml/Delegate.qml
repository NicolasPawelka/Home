import QtQuick

Rectangle {
    id: content
    width: view.width
    height: 200
    border.width: 2
    border.color: "lightsteelblue"
    color: "white"
    radius: 10
    clip: true

    Row{
        anchors.fill: parent
        spacing: 20

        Image{
            id: image
            source: modelData.image
            height: 200
            width: 200
        }

        Column{
            id: column

            Text{ text: "Vorname: " + modelData.forename}
            Text{ text: "Nachname: " + modelData.name}
            Text{ text: "Kurs: " + modelData.course}
            Text{ text: "Alter: " + modelData.age}
            Text{ text: "Matrikelnummer: " + modelData.matriculationNumber}
            Text{ text: "Semester: " + modelData.semester}
        }

        ListView{
            id: view2
            spacing: 10
            model: modelData.modules
            height: content.height
            width: content.width/2
            cacheBuffer: 50
            delegate: Rectangle{
                height: 60
                width: 100
                Column{
                    id: column2
                    Text{text:"Name: "+modelData.name+"(" +modelData.identificationCode + ")"}
                    Text{text:"Schwierigkeit: "+modelData.severity}
                    Text{text:"Lerngruppe: "+modelData.lernenGroup}
                }
            }
        }
    }
}
