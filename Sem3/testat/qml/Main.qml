import QtQuick
import QtQuick.Controls
ApplicationWindow {
    id: root
    width: 700
    height: 1000
    visible: true
    Image{source:"kaffee.jpg";anchors.fill:parent}
    Text{
        id:head
        text:"SET - Kaffemasschine"
        color:"white"
        anchors.top:root.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
    }

    ListView{
        id:view
        spacing:5
        anchors.top:head.bottom
        width:parent.width
        height:parent.height
        model:KaffeeModel{}
        delegate: Delegate{}
        cacheBuffer: 10

    }


}
