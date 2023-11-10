import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    width: 450
    height: 400
    visible: true
    color: "white"

    Text{
        id:ueberschrift
        text: "Power Supply"
        color: "#FF0000"
        font.pixelSize: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }
    RowLayout{
        id: layout1
        spacing:10
        anchors.top: ueberschrift.bottom
        Text{
            text: "Voltage: "
            font.pixelSize: 20
        }
        Slider{
            id:sliderV
            value: powersupply.voltage
            onValueChanged: powersupply.voltage = value
            stepSize:0.1
            to:24
            orientation: Qt.Horizontal
            Layout.minimumWidth: parent.parent.width-170
        }
        Text{
            text:sliderV.value + "V"
            font.pixelSize: 20
        }
    }
    RowLayout{
        id: layout2
        spacing:10
        anchors.top: layout1.bottom
        Text{
            text: "Current: "
            font.pixelSize: 20
        }
        Slider{
            id:sliderC
            value: powersupply.current
            onValueChanged: powersupply.current = value
            stepSize:0.1
            to:2
            orientation: Qt.Horizontal
            Layout.minimumWidth: parent.parent.width-170
        }
        Text{
            text:sliderC.value + "A"
            font.pixelSize: 20
        }
    }
    RowLayout{
        id: layout3
        spacing:10
        anchors.top: layout2.bottom
        Text{
            text: "Max Pow: "
            font.pixelSize: 20
        }
        Slider{
            id:sliderW
            value: powersupply.maxpower
            onValueChanged: powersupply.maxpower = value
            stepSize:0.1
            to:48
            orientation: Qt.Horizontal
            Layout.minimumWidth: parent.parent.width-170
        }
        Text{
            text:sliderW.value + "Watt"
            font.pixelSize: 20
        }
    }


    Text{
        id:powertext2
        text: "Power: " + powersupply.power + " Watt"
        font.pixelSize: 20
        anchors.top:layout3.bottom
    }

    Button{
        anchors.bottom:parent.bottom
        onClicked: close()
        text:"close"
        width: parent.width
    }


}
