import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage
import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {
    id:gameroot
    height:root.height
    width: root.width
    visible:false
    property bool run: true
    function resetBoard(){
        run = false;
        for(var i = 0; i < game.board.length  ; ++i){
            game.board[i] = ""
            repeater.itemAt(i).sign = ""
        }

        game.currentPlayer = "X"
    }
    Rectangle {
        id:grid
        width: root.width
        height: root.height
        color: "white"

        Grid {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            columns: 3
            rows: 3
            spacing: 10

            Repeater {
                id:repeater
                model: 9
                Rectangle {
                    id:field
                    width: 200
                    height: 200
                    color: "lightblue"
                    border.color: "blue"
                    border.width: 2
                    property string sign : ""
                    Text{
                        id:symbol
                        font.pixelSize: 150
                        anchors.centerIn: parent
                        text:parent.sign
                    }


                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (run === false)
                                return;
                            if (game.currentPlayer === "X") {
                                if(parent.sign === "O"){
                                    return
                                }else{
                                    parent.sign = "X"
                                    game.play("X", index)

                                }

                            } else if (game.currentPlayer === "O" ) {

                                if (run === false)
                                    return
                                if(parent.sign === "X"){
                                    return
                                }else{
                                    parent.sign = "O"
                                    game.play("O", index)

                                }
                            }
                        }

                    }

                }
            }

        }

        Item {
            id: game
            property string currentPlayer: "X"

            function play(player, index) {
                if (board[index] === "") {
                    board[index] = player;
                    if (checkWin(player)) {
                        if(currentPlayer==="X"){
                            closeX.open()
                        }else if(currentPlayer === "O"){
                            closeO.open()
                        }
                        resetBoard()
                    } else if (checkDraw()) {
                        draw.open()
                        resetBoard()
                    } else {
                        currentPlayer = currentPlayer === "X" ? "O" : "X"
                    }
                }
            }

            function checkWin(player) {
                var b = board

                // spalten überprüfen
                for (var j = 0; j < 3; j++) {
                    if (b[j] === player && b[j+3] === player && b[j+6] === player) {
                        return true
                    }
                }
                // reihen überprüfen
                for (var i = 0; i < 3; i++) {
                    if (b[3*i] === player && b[3*i+1] === player && b[3*i+2] === player) {
                        return true
                    }
                }


                // diagonale überprüfen
                if (b[0] === player && b[4] === player && b[8] === player) {
                    return true
                }

                // andere diagonale überprüfen
                if (b[2] === player && b[4] === player && b[6] === player) {
                    return true
                }

                return false
            }

            //überprüfen ob kein gültiger Zug mehr möglich ist
            function checkDraw() {
                for (var i = 0; i < board.length; i++) {
                    if (board[i] === "") {
                        return false
                    }
                }
                return true
            }


            property var board: ["", "", "", "", "", "", "", "", ""]
        }


        Popup{
            id:closeX
            anchors.centerIn: parent
            onClosed:run = true
            Text{
                anchors.centerIn: parent
                text:"Der Gewinner lautet Spieler X"
                font.pixelSize: 50
            }
        }
        Popup{
            id:closeO
            anchors.centerIn: parent
            onClosed: run = true
            Text{
                anchors.centerIn: parent
                text:"Der Gewinner lautet Spieler O"
                font.pixelSize: 50
            }
        }
        Popup{
            id:draw
            anchors.centerIn: parent
            onClosed: run = true
            Text{
                anchors.centerIn: parent
                text:"Unentschieden"
                font.pixelSize: 50
            }
        }

        Button{
            background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
            height:50
            width:parent.width
            anchors.bottom:parent.bottom
            Text{text:"Zurück";anchors.centerIn: parent;font.pixelSize: 20}
            onClicked:stack.pop(submenu)


        }


    }
}
