import QtQuick

ListModel{        

    ListElement{
        produktNr: 1
        name: "Espresso Macchiato"
        image: "qrc:/espresso.jpg"
        preis: "1,30 €"
        heat: 95
        grindTime: 3
        waterTime: 1
        waitingTime: 2
        milkTime: 2
    }

    ListElement{
        produktNr: 2
        name: "Espresso"
        image: "qrc:/espressomacchiato.jpg"
        preis: "1,10 €"
        heat: 95
        grindTime: 3
        waterTime: 1
        waitingTime: 0
        milkTime: 0
    }

    ListElement{
        produktNr: 3
        name: "Cappuccino"
        image: "qrc:/cappuccino.jpg"
        preis: "1,50 €"
        heat: 90
        grindTime: 2
        waterTime: 3
        waitingTime: 2
        milkTime: 5
    }
}
