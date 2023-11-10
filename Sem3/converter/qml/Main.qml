import QtQuick
import QtQuick.Controls 2.5

ApplicationWindow {
    id: mainWindow
    width: 800
    height: 700
    visible: true
    Rectangle{
        width:mainWindow.width
        height:mainWindow.height
        Image{source: "hintergrund.jpg";anchors.top:parent.top;anchors.bottom:parent.bottom}
        Text{text:"Number Converter";anchors.bottom:mainColumn.top;anchors.horizontalCenter: parent.horizontalCenter;font.pixelSize: 40}
        Column{
            id:mainColumn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5
            TextField{
                id:inputBinary
                height:mainWindow.height/14
                width:mainWindow.width/2
                font.pixelSize: 25
                text:converter.bin
                validator: RegularExpressionValidator{
                    regularExpression: /^[01]{0,26}$/
                }
                onTextChanged: converter.bin = inputBinary.text
            }
            TextField{
                id:inputDecimal
                height:mainWindow.height/14
                width:mainWindow.width/2
                font.pixelSize: 25
                text:converter.dec
                validator: RegularExpressionValidator{
                    regularExpression: /^[0-9]{0,28}$/
                }
                onTextChanged:  converter.dec = inputDecimal.text
            }
            TextField{
                id:inputOctal
                height:mainWindow.height/14
                width:mainWindow.width/2
                font.pixelSize: 25
                text:converter.oct
                validator: RegularExpressionValidator{
                    regularExpression: /^[0-7]{0,28}$/
                }
                onTextChanged:  converter.oct = inputOctal.text
            }
            TextField{
                id:inputHexa
                height:mainWindow.height/14
                width:mainWindow.width/2
                font.pixelSize: 25
                text:converter.hex
                validator: RegularExpressionValidator{
                    regularExpression: /^[0-9,a-f]{0,28}$/
                }
                onTextChanged:  converter.hex = inputHexa.text

            }


        }
        Column{
            id:textColumn
            anchors.right:mainColumn.left
            anchors.verticalCenter: parent.verticalCenter
            spacing:20
            Text{text:"Binary";font.pixelSize: 25}
            Text{text:"Decimal";font.pixelSize: 25}
            Text{text:"Octal";font.pixelSize: 25}
            Text{text:"Hexadecimal";font.pixelSize: 25}
        }
    }
}
