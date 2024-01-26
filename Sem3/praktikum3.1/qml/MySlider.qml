
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

Rectangle{
    id: mySlider
    width:parent.width
    height:30
    property string myName
    property int myRange
    property string einheit
    property real myValue: 0.0
    anchors.horizontalCenter: parent.horizontalCenter

    RowLayout{
        spacing:10
        Text{
            text: myName
            font.pixelSize: 20
        }
        Slider{
            id:mySlider1
            value: mySlider.myValue
            onValueChanged: mySlider.myValue = value
            stepSize:1
            to:myRange
            orientation: Qt.Horizontal
            Layout.minimumWidth: parent.parent.width-170
        }
    }
        Text{
            anchors.right: parent.right
            text: mySlider1.value + einheit
            font.pixelSize: 20
        }
}

