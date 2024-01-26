import QtQuick
import QtQuick.Controls
Rectangle{
    id:content
    width:root.width
    height:root.height/7
    radius:10
        Image{
            id:bild
            source:image
            anchors.left:parent.left
            height:content.height
            width:content.width/5
            opacity:1
        }
        Text{
            id:text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text:name
            font.pixelSize: 15
        }
        Text{
            id:pay
            anchors.right:parent.right
            anchors.verticalCenter: parent.verticalCenter
            text:preis
            font.pixelSize: 15


    }
    MouseArea{
        anchors.fill:parent
        onClicked:{
            console.log(produktNr + " / " + name);
            Automat.makeKaffee(heat,grindTime,waterTime,waitingTime,milkTime);
        }
    }

}
