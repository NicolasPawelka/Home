import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    width: 400
    height: 300
    visible: true
    Image{source:"hs-mannheim.jpg";anchors.top:parent.top;anchors.left: parent.left;anchors.right:parent.right}
    Row{
        spacing: 2
        anchors.centerIn: parent
        MyButton{
            id:button1
            name: "Button 1"
            //onClicked:{console.log(name + "clicked" + state)}
        }
        MyButton{
            id:button2
             name:"Button 2"
            // onClicked:{console.log(name + "clicked" + state)}
        }
        MyButton{
            id:button3
             name:"Button 3"
             //onClicked:{console.log(name + "clicked" + state)}
        }

    }

}
