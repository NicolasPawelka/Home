import QtQuick

Rectangle{
    id:content
    width:view.width
    height: column.height
    radius: 10
    clip:true
    Row{
        anchors.fill:parent
        spacing:20
        Image{
            id:image
            source:modelData.image
            height:100
            width:100
            smooth:true
            opacity:1
        }
        Column{
            id:column
            Text { text: 'Vorname: ' + modelData.forename }
            Text { text: 'Name: ' + modelData.name }
            Text { text: 'Studiengang: ' + modelData.course }
            Text { text: 'Alter: ' + modelData.age }
            Text { text: 'Matrikelnummer: ' + modelData.matriculationNumber }
            Text { text: 'Semester: ' + modelData.semester }

        }


        ListView{
            id:view2
            model: modelData.modules
            height: content.height
            width: content.width/2
            cacheBuffer: 50
            delegate: Rectangle {
                height: 69
                width: 100
                Column{
                    id:column2
                    Text{text:'Name: ' + modelData.name +' ('+ modelData.identificationCode+')'}
                    Text{text:'Severity: ' + modelData.severity}
                    Text{text:'Lerngruppe: ' + modelData.lernenGroup}
                }


            }


        }

    }
}
