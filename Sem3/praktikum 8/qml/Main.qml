import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage
import QtQuick 2.0
import QtQuick.LocalStorage 2.0
ApplicationWindow {
    id: mainWindow
    width: 400
    height: 300
    visible: true
    color:"magenta"
    Column{
        anchors.left:parent.left
        anchors.bottom:parent.bottom
        Text{text:"Berechne Zahl e";font.pixelSize: 10;}
        Button{
            id:button
            width:75
            height:25
            Text{text:"Berechnen";anchors.centerIn: parent}
            onClicked:myThread.start()
        }
        Text{
            text:myThread.result
        }

    }

}
