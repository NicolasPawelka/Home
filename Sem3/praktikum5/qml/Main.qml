import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id:root
    width: 800
    height: 500
    visible:true
    function readFile() {
     var request = new XMLHttpRequest()
     request.open('GET', 'qrc:/Kommilitonen.txt')
     request.onreadystatechange = function(event) {
     if (request.readyState === XMLHttpRequest.DONE) {
     view.model = JSON.parse( request.responseText )
     }
     }
     request.send();
     }
    ListView{
        id:view
        spacing: 5
        anchors{
            fill:parent
            margins:2
        }
        delegate:KommilitonDelegate{}
        cacheBuffer: 50

    }


    Component.onCompleted:{
        readFile();
        root.show()
    }

}
