import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import database 1.0
import user 1.1
import Qt.labs.settings 1.0

ApplicationWindow {
    id: root
    width: 1920
    height: 1080
    visible: true
    color:"#654a35"
    property int counter: 0
    property double pay: 0.0

    function passwordcheck(name,password,temp){
        if(listModel2.password(name,password)){
            if(temp===1){
                stack.push(add);
            }else{
                stack.push(addcash);
            }
            usernamelogin.text = "";
            passwordlogin.text = "";
        }
        else{
            popup.open()
        }
    }
    function hasPressed(index){
        if(index===1){
            for(var child in view.contentItem.children){
                if(view.contentItem.children[child].state === "PRESSED"){
                    counter = counter + 1
                }
            }
            if(counter === 1){
                counter = 0
                return 1
            }
            else if(counter === 0){
                counter = 0
                return 0
            }
            else{
                counter = 0
                return 2
            }
        }else{
            for(var i in addcashview.contentItem.children){
                if(addcashview.contentItem.children[i].state === "PRESSED"){
                    counter = counter + 1
                }
            }
            if(counter === 1){
                counter = 0
                return 1
            }
            else{
                counter = 0
                return 2
            }
        }
    }
    function resetPressed(){
        for(var child in view.contentItem.children){
            if(view.contentItem.children[child].state === "PRESSED"){
                view.contentItem.children[child].state = "NOTPRESSED"
            }
        }
    }
    function passwordVerify(InputPassword,index){
        var password = "test"
        for(var child in view.contentItem.children){
            if(view.contentItem.children[child].state === "PRESSED"){
                password = view.contentItem.children[child].uPassword
            }
        }
        console.log(password)
        if(InputPassword === password){
            return true
        }
        else
            return false
    }
    function getUserName(){
        for(var child in view.contentItem.children){
            if(view.contentItem.children[child].state === "PRESSED"){
                return view.contentItem.children[child].uName
            }
            else
                return ""
        }
    }
    function getKaffee(){
        for(var child in view.contentItem.children){
            if(view.contentItem.children[child].state === "PRESSED"){
                return view.contentItem.children[child].uKaffee
            }
        }
    }
    function getCredit(){
        for(var child in view.contentItem.children){
            if(view.contentItem.children[child].state === "PRESSED"){
                return view.contentItem.children[child].uCredit
            }
        }
    }
    function getIndex(origin){
        var counter = 0;
        if(origin === 0){
            for(var i in view.contentItem.children){
                if(view.contentItem.children[i].state === "PRESSED"){
                    counter = listModel2.findUser(view.contentItem.children[i].uName);
                    return counter;
                }
            }

        }else{
            for(var j in addcashview.contentItem.children){
                if(addcashview.contentItem.children[j].state === "PRESSED"){
                    counter = listModel2.findUser(addcashview.contentItem.children[j].uName);
                    return counter;
                }
            }
        }



    }
    function noInput(origin){
    if(origin === 0){
        for(var i in view.contentItem.children){
            view.contentItem.children[i].selectable = false;
        }
    }else{
        for(var j in addcashview.contentItem.children){
           addcashview.contentItem.children[j].selectable = false;
        }
    }


    }
    function input(origin){
    if(origin === 0){
        for(var i in view.contentItem.children){
            view.contentItem.children[i].selectable = true;
        }
    }else{
        for(var j in addcashview.contentItem.children){
           addcashview.contentItem.children[j].selectable = true;
        }
    }


    }


    StackView{
        id:stack
        initialItem:mainview
        anchors.fill:parent
    }

    Item{
        id:mainview
        visible:false

        Row{
            id: kaffeeListe
            spacing: (root.width-600)/5
            anchors.top: root.top
            Button{
                id: kaffeeSchwarz
                property double preis: 1.00
                icon.color: "transparent"
                icon.source: "qrc:picture/KaffeeSchwarzR.png"
                icon.name: "Kaffee Schwarz"
                icon.height: 100
                icon.width: 100
                background: Rectangle{id:kaffeeSchwarzbackground;anchors.fill: parent; color: "#654a35"}
                onClicked: {
                    if(hasPressed(1) === 1){
                        pay = preis;
                        noInput(0);
                        userVerify.open()
                    }else if(hasPressed(1) === 2){
                        errorZuVieleUser.open()
                    }
                    else if(hasPressed(1) === 0){
                        popupKaffeeSchwarz.open()
                        ksT.start()
                    }
                }
                Popup {
                    id: popupKaffeeSchwarz
                    parent: Overlay.overlay
                    anchors.centerIn: parent
                    width: 400
                    height: 240
                    background: Rectangle{anchors.fill: parent; radius: 20; color: "#8d8d8d"}
                    contentItem:RowLayout{
                        Image {
                            id: popIks
                            source: "qrc:picture/KaffeeSchwarzR.png"
                        }
                        anchors.top: popupKaffeeSchwarz.top
                        anchors.centerIn: popupKaffeeSchwarz.center
                        ColumnLayout{
                            Text{text: kaffeeSchwarz.icon.name}
                            Text{text: kaffeeSchwarz.preis + " €"}
                        }
                    }
                    Timer{id: ksT; interval: 2500;running: true; onTriggered: popupKaffeeSchwarz.close()}
                }
            }

            Button{
                id: kaffeeCrema
                property double preis: 1.20
                icon.color: "transparent"
                icon.source: "qrc:picture/KaffeeCremaR.png"
                icon.name: "Kaffee Crema"
                icon.height: 100
                icon.width: 100
                background: Rectangle{id:kaffeeCremabackground;anchors.fill: parent; color: "#654a35"}
                onClicked: {
                    if(hasPressed(1) === 1){
                        pay = preis;
                        noInput(0);
                        userVerify.open()
                    }else if(hasPressed(1) === 2){
                        errorZuVieleUser.open()
                    }
                    else if(hasPressed(1) === 0){
                        popupKaffeeCrema.open()
                        kcT.start()
                    }
                }
                Popup {
                    id: popupKaffeeCrema
                    parent: Overlay.overlay
                    anchors.centerIn: parent
                    width: 400
                    height: 240
                    background: Rectangle{anchors.fill: parent; radius: 20; color: "#8d8d8d"}
                    contentItem:RowLayout{
                        Image {
                            id: popIkc
                            source: "qrc:picture/KaffeeCremaR.png"
                        }
                        anchors.top: popupKaffeeCrema.top
                        anchors.centerIn: popupKaffeeCrema.center
                        ColumnLayout{
                            Text{text: kaffeeCrema.icon.name}
                            Text{text: kaffeeCrema.preis + " €"}
                        }
                    }
                    Timer{id: kcT; interval: 2500;running: true; onTriggered: popupKaffeeCrema.close()}
                }
            }
            Button{
                id: latteMacchiato
                property double preis: 3.00
                icon.color: "transparent"
                icon.source: "qrc:picture/LmR.png"
                icon.name: "Latte Macchiato"
                icon.height: 100
                icon.width: 100
                background: Rectangle{id:latteMacchiatobackground;anchors.fill: parent; color: "#654a35"}
                onClicked: {
                    if(hasPressed(1) === 1){
                        pay = preis;
                        noInput(0);
                        userVerify.open()
                    }else if(hasPressed(1) === 2){
                        errorZuVieleUser.open()
                    }
                    else if(hasPressed(1) === 0){
                        popupLatteMacchiato.open()
                        lmT.start()
                    }
                }
                Popup {
                    id: popupLatteMacchiato
                    parent: Overlay.overlay
                    anchors.centerIn: parent
                    width: 400
                    height: 240
                    background: Rectangle{anchors.fill: parent; radius: 20; color: "#8d8d8d"}
                    contentItem:RowLayout{
                        Image {
                            id: popIlm
                            source: "qrc:picture/LmR.png"
                        }
                        anchors.top: popupLatteMacchiato.top
                        anchors.centerIn: popupLatteMacchiato.center
                        ColumnLayout{
                            Text{text: latteMacchiato.icon.name}
                            Text{text: latteMacchiato.preis + " €"}
                        }
                    }
                    Timer{id: lmT; interval: 2500;running: true; onTriggered: popupLatteMacchiato.close()}
                }
            }
            Button{
                id: espresso
                property double preis: 0.80
                icon.color: "transparent"
                icon.source: "qrc:picture/EspressoR.png"
                icon.name: "Espresso"
                icon.height: 100
                icon.width: 100
                background: Rectangle{id:espressobackground;anchors.fill: parent; color: "#654a35"}
                onClicked: {
                    if(hasPressed(1) === 1){
                        pay = preis;
                        noInput(0);
                        userVerify.open()
                    }else if(hasPressed(1) === 2){
                        errorZuVieleUser.open()
                    }
                    else if(hasPressed(1) === 0){
                        popupEspresso.open()
                        eT.start()
                    }
                }
                Popup {
                    id: popupEspresso
                    parent: Overlay.overlay
                    anchors.centerIn: parent
                    width: 400
                    height: 240
                    background: Rectangle{anchors.fill: parent; radius: 20; color: "#8d8d8d"}
                    contentItem:RowLayout{
                        Image {
                            id: popIe
                            source: "qrc:picture/EspressoR.png"
                        }
                        anchors.top: popupEspresso.top
                        anchors.centerIn: popupEspresso.center
                        ColumnLayout{
                            Text{text: espresso.icon.name}
                            Text{text: espresso.preis + " €"}
                        }
                    }
                    Timer{id: eT; interval: 2500;running: true; onTriggered: popupEspresso.close()}
                }
            }
            Button{
                id: cappuccino
                property double preis: 2.00
                icon.color: "transparent"
                icon.source: "qrc:picture/CappuccinoR.png"
                icon.name: "Cappuccino"
                icon.height: 100
                icon.width: 100
                background: Rectangle{id:cappuccinobackground;anchors.fill: parent; color: "#654a35"}
                onClicked: {
                    if(hasPressed(1) === 1){
                        pay = preis;
                        noInput(0);
                        userVerify.open()
                    }else if(hasPressed(1) === 2){
                        errorZuVieleUser.open()
                    }
                    else if(hasPressed(1) === 0){
                        popupCappuccino.open()
                        cT.start()
                    }
                }
                Popup {
                    id: popupCappuccino
                    parent: Overlay.overlay
                    anchors.centerIn: parent
                    width: 400
                    height: 240
                    background: Rectangle{anchors.fill: parent; radius: 20; color: "#8d8d8d"}
                    contentItem:RowLayout{
                        Image {
                            id: popIc
                            source: "qrc:picture/CappuccinoR.png"
                        }
                        anchors.top: popupCappuccino.top
                        anchors.centerIn: popupCappuccino.center
                        ColumnLayout{
                            Text{text: cappuccino.icon.name}
                            Text{text: cappuccino.preis + " €"}
                        }
                    }
                    Timer{id: cT; interval: 2500;running: true; onTriggered: popupCappuccino.close()}
                }
            }
        }

        Button{
            id: burgerMenue
            anchors.right: parent.right
            height: 100
            width: 100
            background: Rectangle{id:burgerMenuebackground;anchors.fill: parent; color: "#654a35"}
            icon.color: "transparent"
            icon.source: "qrc:picture/Hamburger_icon.png"
            icon.name: "HamburgerMenue"
            icon.height: 100
            icon.width: 100
            onClicked:{stack.push(submenu);resetPressed()}
        }

        ListView{
            id: view
            width:parent.width
            height:parent.height
            anchors.top:burgerMenue.bottom
            model:listModel2.userlist
            delegate: Delegate{}
            clip: true
            spacing: 4
            cacheBuffer:600
        }

    }

    Item{
        id:submenu
        visible:false
        Column{
            id:buttoncolumn
            height: parent.height
            width: parent.width
            Button{
                id:admin
                background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
                height:buttoncolumn.height/4
                width:buttoncolumn.width
                Text{text:"User hinzufügen/entfernen";anchors.centerIn: parent;font.pixelSize: 30}
                onClicked:stack.push(submenulogin)
            }
            Button{
                id:kasse
                background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
                height:buttoncolumn.height/4
                width:buttoncolumn.width
                Text{text:"Geld aufladen";anchors.centerIn: parent;font.pixelSize: 30}
                onClicked:stack.push(submenucash)
            }
            Button{
                id:settings
                background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
                height:buttoncolumn.height/4
                width:buttoncolumn.width
                Text{text:"While waiting";anchors.centerIn: parent;font.pixelSize: 30}
                onClicked: stack.push(game)

            }
            Button{
                id:back
                background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
                height:buttoncolumn.height/4
                width:buttoncolumn.width
                Text{text:"Zurück";anchors.centerIn: parent;font.pixelSize: 30}
                onClicked:stack.pop()

            }
        }
    }

    Item{
        id:submenulogin
        visible:false
        Rectangle{
            anchors.fill:parent
            color:"#654a35"
            Rectangle{
                anchors.centerIn:parent
                height:parent.parent.height/3
                width:parent.parent.width/3
                radius:10
                color:"#8D97FC"
                Column{
                    id:logincolumn
                    spacing:15
                    height:parent.height
                    width:parent.width
                    anchors.horizontalCenter:parent.horizontalCenter
                    Text{text:"Bitte login Daten eingeben"
                        font.pixelSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:usernametext
                            text:"Username: "
                            font.pixelSize: 30
                        }
                        TextField{
                            id:usernamelogin
                            placeholderText: "Max Mustermann"
                            font.pixelSize: 25
                            height:40
                            width:200
                        }
                        Image{source:"qrc:picture/Login_Icon.jpg"; height:usernamelogin.height;width:40}

                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:passwordtext
                            text:"Passwort: "
                            font.pixelSize: 30
                            width: 148
                        }
                        TextField{
                            id:passwordlogin
                            passwordCharacter: "*"
                            height:40
                            width:200
                            font.pixelSize: 25
                            echoMode: TextField.Password
                            maximumLength: 20
                            onAccepted: passwordcheck(usernamelogin.text,passwordlogin.text,1)
                        }
                        Button{
                            id:auge
                            icon.color:"transparent"
                            icon.source: "qrc:picture/Auge_Icon.png"
                            icon.name: "Auge"
                            icon.height: 33
                            icon.width: 40
                            onClicked:{
                                passwordlogin.echoMode === 2?passwordlogin.echoMode = 0:passwordlogin.echoMode = 2;
                            }

                        }
                    }
                }
                Button{
                    id:confirmlogin
                    anchors.bottom:parent.bottom
                    height:parent.height/5
                    width:parent.width
                    background:Rectangle{
                        anchors.fill:parent
                        border.color: "#8d8d8d"
                    }
                    Text{text:"Bestätigen";font.pixelSize: 30;anchors.centerIn: parent}
                    onClicked:{

                        passwordcheck(usernamelogin.text,passwordlogin.text,1);
                    }

                }
            }
        }

        Button{
            id:back2submenu
            background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
            height:50
            width:parent.width
            anchors.bottom:parent.bottom
            Text{text:"Zurück";anchors.centerIn: parent;font.pixelSize: 30}
            onClicked:{stack.pop();usernamelogin.text="";passwordlogin.text=""}
        }
    }

    Item{
        id:submenucash
        visible:false
        Rectangle{
            anchors.centerIn:parent
            height:parent.height/3
            width:parent.width/3
            radius:10
            color:"#8D97FC"
            Column{
                id:cashcolumn
                spacing:15
                height:parent.height
                width:parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Text{anchors.horizontalCenter: parent.horizontalCenter
                    text:"Bitte login Daten eingeben"
                    font.pixelSize: 30
                }
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{id:cashusernametext
                        text:"Username: "
                        font.pixelSize: 30
                    }
                    TextField{
                        id:cashusernamelogin
                        placeholderText: "Max Mustermann"
                        font.pixelSize: 25
                        height:40
                        width:200
                    }
                    Image{source:"qrc:picture/Login_Icon.jpg"; height:40;width:40}

                }
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{id:cashpasswordtext
                        text:"Passwort: "
                        font.pixelSize: 30
                        width: 148
                    }
                    TextField{
                        id:cashpasswordlogin
                        passwordCharacter: "*"
                        height:40
                        width:200
                        font.pixelSize: 25
                        echoMode: TextField.Password
                        maximumLength: 20
                        onAccepted: {
                            passwordcheck(cashusernamelogin.text,cashpasswordlogin.text,0);
                            cashpasswordlogin.text="";
                            cashusernamelogin.text="";
                        }
                    }
                    Button{
                        id:auge2
                        icon.color:"transparent"
                        icon.source: "qrc:picture/Auge_Icon.png"
                        icon.name: "Auge"
                        icon.height: 33
                        icon.width: 40
                        onClicked:{

                            cashpasswordlogin.echoMode === 2?cashpasswordlogin.echoMode = 0:cashpasswordlogin.echoMode = 2;
                        }
                    }
                }
            }
            Button{
                id:confirmlogin2
                height:parent.height/5
                width:parent.width
                anchors.bottom:parent.bottom
                Text{text:"Bestätigen";anchors.centerIn: parent;font.pixelSize: 30}
                onClicked:{
                    passwordcheck(cashusernamelogin.text,cashpasswordlogin.text,0)
                    cashpasswordlogin.text="";
                    cashusernamelogin.text="";
                }
            }
        }

        Button{
            id:cashback2submenu3
            background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
            height:50
            width:parent.width
            anchors.bottom:parent.bottom
            Text{text:"zurück";anchors.centerIn: parent;font.pixelSize: 30}
            onClicked:{
                cashusernamelogin.text=""
                cashpasswordlogin.text=""
                stack.pop(submenu)
            }
        }
    }

    Item{
        id:addcash
        visible: false
        ListView{
            id:addcashview
            width:parent.width
            height:parent.height
            model:listModel2.userlist
            delegate: Delegate{}
            clip:true
            spacing:4
            cacheBuffer:600
        }
        Button{
            id:plus
            height:50
            width:parent.width
            anchors.bottom:cashback2submenu2.top
            Text{text:"+";anchors.centerIn: parent;font.pixelSize: 30}
            onClicked: {
                if(hasPressed(2) === 1){
                    confirmCash.open()
                    noInput(1);
                }else if(hasPressed(2) === 2){
                    errorZuVieleUser.open()
                }
            }
        }
        Button{
            id:cashback2submenu2
            background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
            width:parent.width
            height:50
            anchors.bottom:parent.bottom
            Text{text:"Zurück";anchors.centerIn: parent;font.pixelSize: 30}
            onClicked:stack.pop(submenu)
        }

    }

    Item{
        id:add
        visible:false
        Rectangle{
            anchors.fill:parent
            color:"#654a35"
            Rectangle{
                anchors.centerIn:parent
                height:parent.parent.height/3
                width:parent.parent.width/3
                radius:10
                color:"#8D97FC"
                Column{
                    id:addcolumn
                    spacing:5
                    height:parent.height
                    width:parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{anchors.horizontalCenter: parent.horizontalCenter
                        text:"Bitte Daten angeben"
                        font.pixelSize: 30
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:addusernametext
                            text:"Username: "
                            font.pixelSize: 30
                        }
                        TextField{
                            id:addusername
                            placeholderText: "Max Mustermann"
                            font.pixelSize: 25
                            height:40
                            width:200
                        }
                        Image{source:"qrc:picture/Login_Icon.jpg"; height:40;width:40}

                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:addpasswordtext
                            text:"Passwort: "
                            font.pixelSize: 30
                            width: 148
                        }
                        TextField{
                            id:addpassword
                            height:40
                            width:200
                            font.pixelSize: 25
                            maximumLength: 20
                        }
                        Image{source:"qrc:picture/Password_Icon.png";height:40;width:40}
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:addemailtext
                            text:"Email: "
                            font.pixelSize: 30
                            width:108
                        }
                        TextField{
                            id:addemail
                            placeholderText: "maxmustermann@mail.de"
                            height:40
                            width:200
                            font.pixelSize: 25
                            onAccepted:{
                                if(addpassword.text !== "" && addemail.text !== "" && addusername.text !== ""){
                                    listModel2.add(addusername.text,addemail.text,addpassword.text,"false");
                                }
                                addusername.text = ""
                                addpassword.text = ""
                                addemail.text = ""
                            }
                        }
                    }
                }
                Row{
                    anchors.bottom:parent.bottom
                    height:parent.height/5
                    width:parent.width
                    Button{
                        width:parent.width/2
                        height:parent.height
                        background:Rectangle{
                            anchors.fill:parent
                            border.color: "#8d8d8d"
                        }
                        Text{text:"Weiteren User hinzufügen";anchors.centerIn: parent;font.pixelSize: 20}
                        onClicked:{
                            if(addpassword.text !== "" && addemail.text !== "" && addusername.text !== ""){
                                listModel2.add(addusername.text,addemail.text,addpassword.text,false);
                            }
                            addpassword.text = ""
                            addemail.text = ""
                            addusername.text = ""
                        }
                    }
                    Button{
                        width:parent.width/2
                        height:parent.height
                        background:Rectangle{
                            anchors.fill:parent
                            border.color: "#8d8d8d"
                        }
                        Text{text:"Entfernen";anchors.centerIn: parent;font.pixelSize: 20}
                        onClicked:{
                            if( addusername.text !== ""){
                                if(listModel2.deletUser(addusername.text) === false){
                                    noUser.open()
                                }
                                addpassword.text = ""
                                addemail.text = ""
                                addusername.text = ""
                            }
                        }
                    }

                }

            }

            Button{
                id:backHome
                background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
                height:50
                width:parent.width
                anchors.bottom:parent.bottom
                Text{text:"Home";anchors.centerIn: parent;font.pixelSize: 20}
                onClicked:{
                    stack.pop(mainview)
                    addpassword.text = ""
                    addemail.text = ""
                    addusername.text = ""
                }
            }

        }
    }
    Item{
        id:submenusettings
        visible:false
        Rectangle{
            anchors.fill:parent
            color:"#654a35"
            ListView{
                id: submenuview
                width:parent.width
                height:parent.height
                model:listModel2.userlist
                delegate: Delegate{}
                clip: true
                spacing: 4
                cacheBuffer:600
            }
            Button{
                id:settingsback2submenu
                background: Rectangle{border.width: height/40;border.color:"lightsteelblue";anchors.fill: parent;color:"#d3d3d3"}
                height:50
                width:parent.width
                anchors.bottom:parent.bottom
                Text{text:"zurück";anchors.centerIn: parent;font.pixelSize: 30}
                onClicked:stack.pop(submenu)
            }

        }
    }

    Component.onCompleted:{
        if(listModel2.isEmpty()){
            root.show();
            stack.push(addAdmin)
        }else{
            listModel2.update();
            root.show()
        }

    }

    Popup {
        id: popup
        anchors.centerIn: parent
        width: 350
        height: 70
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape |Popup.CloseOnPressOutside
        Text{text:"Falsche Login eingegeben!";font.pixelSize: 20;anchors.centerIn: parent;color:"red"}
        Button{
            id:closepopup
            anchors.top:parent.top
            anchors.right:parent.right
            icon.color: "transparent"
            icon.source: "qrc:picture/close_Icon.png"
            icon.name: "ClosePopup"
            icon.height: 10
            icon.width: 10
            onClicked: popup.close()
        }
    }
    Popup {
        id: noUser
        anchors.centerIn: parent
        width: 350
        height: 70
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape |Popup.CloseOnPressOutside
        Text{text:"User existiert nicht oder ist Admin!";font.pixelSize: 20;anchors.centerIn: parent;color:"red"}
        Button{
            id:closeNoUser
            anchors.top:parent.top
            anchors.right:parent.right
            icon.color: "transparent"
            icon.source: "qrc:picture/close_Icon.png"
            icon.name: "ClosePopup"
            icon.height: 10
            icon.width: 10
            onClicked: noUser.close()
        }
    }
    Popup{
        id: errorZuVieleUser
        anchors.centerIn: parent
        width: 350
        height: 70
        modal: true
        focus: true
        closePolicy:Popup.CloseOnPressOutside | Popup.CloseOnEscape
        Text{text:"Bitte nur einen User auswählen!";font.pixelSize: 20;anchors.centerIn: parent;color:"red"}
        Button{
            id:closeerrorZuVieleUser
            anchors.top:parent.top
            anchors.right:parent.right
            icon.color: "transparent"
            icon.source: "qrc:picture/close_Icon.png"
            icon.name: "CloseError"
            icon.height: 10
            icon.width: 10
            onClicked: errorZuVieleUser.close()
        }
    }

    Popup {
        id: userVerify
        anchors.centerIn: parent
        width: root.width/3
        height: root.height/3
        background: Rectangle{anchors.fill: parent; radius: 20; color: "#8D97FC"}
        onClosed: {input(0);resetPressed()}
        Rectangle{
            anchors.fill: parent
            height:root.height/3
            width:root.width/3
            radius:10
            color:"#8D97FC"
            Column{
                id:userVerifyColumn
                height:parent.height
                width:parent.width
                spacing: 50
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: verifyText
                    font.pixelSize: 30
                    text: qsTr("Bitte Passwort bestätigen")
                }
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{id:passwordVerifyText
                        text:"Passwort: "
                        font.pixelSize: 30
                        width: 148
                    }
                    TextField{
                        id:passwordVerifyLogin
                        passwordCharacter: "*"
                        height:40
                        width:200
                        font.pixelSize: 25
                        echoMode: TextField.Password
                        maximumLength: 20
                        onAccepted: {
                            if(listModel2.passwordVerify(getIndex(0),passwordVerifyLogin.text)){
                                console.log("Hallo")
                                listModel2.change2(getIndex(0),pay)
                                listModel2.update();
                                passwordVerifyLogin.text=""
                                userVerify.close()
                            }else{
                                popup.open()
                            }
                        }
                    }
                    Button{
                        id:augeVerify
                        icon.color:"transparent"
                        icon.source: "qrc:picture/Auge_Icon.png"
                        icon.name: "Auge"
                        icon.height: 33
                        icon.width: 40
                        onClicked:{passwordVerifyLogin.echoMode === 2?passwordVerifyLogin.echoMode = 0:passwordVerifyLogin.echoMode = 2;}
                    }
                }

            }
            Button{
                id:confirmVerify
                anchors.bottom:parent.bottom
                height:parent.height/5
                width:parent.width
                background:Rectangle{anchors.fill:parent;border.color: "#8d8d8d"}
                Text{text:"Bestätigen";font.pixelSize: 30;anchors.centerIn: parent}
                onClicked:{
                    if(listModel2.passwordVerify(getIndex(0),passwordVerifyLogin.text)){
                        listModel2.change2(getIndex(0),pay)
                        listModel2.update();
                        passwordVerifyLogin.text=""
                        userVerify.close()
                    }else{
                        popup.open()
                    }
                }
            }
        }
        Button{
            id:closeVerify
            anchors.top:parent.top
            anchors.right:parent.right
            icon.color: "transparent"
            icon.source: "qrc:picture/close_Icon.png"
            icon.name: "ClosePopup"
            icon.height: 10
            icon.width: 10
            onClicked: {
                userVerify.close()
                passwordVerifyLogin.text=""
            }
        }

    }
    Popup{
        id:confirmCash
        anchors.centerIn: parent
        width: root.width/3
        height: root.height/3
        background: Rectangle{anchors.fill: parent; radius: 20; color: "#8D97FC"}
        onClosed: {input(1);resetPressed()}
        Rectangle{
            anchors.fill: parent
            height:root.height/4
            width:root.width/4
            radius:10
            color:"#8D97FC"
                Text {
                    id: verifyTextCash
                    font.pixelSize: 30
                    anchors.top:parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Wie viel wollen sie aufladen?")
                }
                TextField{
                    id:cashplus
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:parent.parent.width
                    height:50
                    placeholderText: "Euro"
                    font.pixelSize: 25
                    validator: DoubleValidator {
                        bottom: 0.0;
                        top: 999.99;
                        decimals: 2;
                        notation: DoubleValidator.StandardNotation
                    }
                }
                Button{
                    id:confirmCashLoad
                    height:parent.height/5
                    width:parent.width
                    anchors.bottom:parent.bottom
                    background:Rectangle{anchors.fill:parent;border.color: "#8d8d8d"}
                    Text{text:"Bestätigen";font.pixelSize: 20;anchors.centerIn: parent}
                    onClicked:{
                        listModel2.addCash(getIndex(1),parseFloat(cashplus.text))
                        confirmCash.close();
                        cashplus.text = "";
                    }
                }

        }
    }


    Game{
        id:game
    }

    Item{
        id:addAdmin
        visible:false
        Rectangle{
            anchors.fill:parent
            color:"#654a35"
            Rectangle{
                anchors.centerIn:parent
                height:parent.parent.height/3
                width:parent.parent.width/3
                radius:10
                color:"#8D97FC"
                Column{
                    id:admincolumn
                    spacing:5
                    height:parent.height
                    width:parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{anchors.horizontalCenter: parent.horizontalCenter
                        text:"Bitte Admin anlegen"
                        font.pixelSize: 30
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:addAdminametext
                            text:"Username: "
                            font.pixelSize: 30
                        }
                        TextField{
                            id:addAdminName
                            placeholderText: "Max Mustermann"
                            font.pixelSize: 25
                            height:40
                            width:200
                        }
                        Image{source:"qrc:picture/Login_Icon.jpg"; height:40;width:40}

                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:addAdminPasswordText
                            text:"Passwort: "
                            font.pixelSize: 30
                            width: 148
                        }
                        TextField{
                            id:addAdminPassword
                            height:40
                            width:200
                            font.pixelSize: 25
                            maximumLength: 20
                        }
                        Image{source:"qrc:picture/Password_Icon.png";height:40;width:40}
                    }
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{id:addAdminEmailText
                            text:"Email: "
                            font.pixelSize: 30
                            width:108
                        }
                        TextField{
                            id:addAdminEmail
                            placeholderText: "maxmustermann@mail.de"
                            height:40
                            width:200
                            font.pixelSize: 25
                        }
                    }
                }
                Row{
                    anchors.bottom:parent.bottom
                    height:parent.height/5
                    width:parent.width
                    Button{
                        width:parent.width
                        height:parent.height
                        background:Rectangle{
                            anchors.fill:parent
                            border.color: "#8d8d8d"
                        }
                        Text{text:"Bestätigen";anchors.centerIn: parent;font.pixelSize: 20}
                        onClicked:{
                            if(addAdminPassword.text !== "" && addAdminEmail.text !== "" && addAdminName.text !== ""){
                                listModel2.add(addAdminName.text,addAdminEmail.text,addAdminPassword.text,"true");
                                 stack.pop();
                            }
                            addAdminPassword.text = ""
                            addAdminEmail.text = ""
                            addAdminName.text = ""
                        }
                    }
                }

            }

        }

    }    
}

