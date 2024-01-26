import QtQuick 2.5
import QtQuick.Controls 2.0

Item {
    id: root

    property alias tst_mouseArea: mouseArea

    Label {
        anchors.centerIn: parent
        text: qsTr("Hallo Welt Page/Stack!")
    }

    MouseArea {
        id: mouseArea
        property bool wasClicked: false
        anchors.fill: parent
        onClicked: {
            console.log( "Simulated click: " + mouse.x + " " + mouse.y )
            wasClicked = true;
        }
    }
}
