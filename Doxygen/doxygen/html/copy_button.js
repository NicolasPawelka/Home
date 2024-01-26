class CopyButton {
    constructor() {
        this.addClickEvent();
        this.addEditClickEvent();
    }
    handler(text, buttonNumber) {
        navigator.clipboard.writeText(text)
            .then(() => {
                let button = document.querySelectorAll(".copyButton");
                button[buttonNumber - 1].setAttribute("content", "Kopiert");
                button[buttonNumber - 1].style.backgroundImage = 'url("../images/check.svg")';

                setTimeout(() =>{
                    button[buttonNumber-1].style.backgroundImage = 'url("../images/Copy_to_clipboard.svg")';
                },1000);
            })
            .catch(err => {
                console.error(`Fehler beim Kopieren ${buttonNumber}`, err);
            })
    }
    addClickEvent() {
        let copyButtons = document.querySelectorAll(".copyButton");
        copyButtons.forEach(button => {
            button.addEventListener("click", () => {
                const buttonNumber = button.getAttribute("button-number");
                var textToCopy = button.parentElement.textContent.trim();
                 textToCopy = this.formatText(textToCopy);
                 console.log(buttonNumber);
                this.handler(textToCopy, buttonNumber);
            });
        });
    };

    addEditClickEvent() {
        let editButtons = document.querySelectorAll(".editButton");
        editButtons.forEach(button => {
            button.addEventListener("click", () => {
                const codeElement = button.parentElement;
                const isEditing = codeElement.getAttribute("data-editing") === "true";
    
                if (!isEditing) {
                    codeElement.contentEditable = true;
                    codeElement.focus();
                    codeElement.setAttribute("data-editing", "true");
                } else {
                    codeElement.contentEditable = false;
                    codeElement.setAttribute("data-editing", "false");
                }
            });
        });
    }
    

    formatText(input) {
        const index = input.lastIndexOf('\n');
        if(index !== -1){
            return input.substring(0,index +1);
        }
        return input;

    }

}
window.onload = function () {
    let memitemElements = document.querySelectorAll(".fragment");
    memitemElements.forEach(function (memitemElement, index) {
        const copyButton = document.createElement("button"); 
        const editButton = document.createElement("button");
        copyButton.setAttribute("class", "copyButton");
        editButton.setAttribute("class", "editButton"); 
        copyButton.classList.add("button");
        editButton.classList.add("button");
        copyButton.setAttribute("button-number", index + 1);
        editButton.setAttribute("button-number",index +1);
        copyButton.style.height = 20 + 'px';
        editButton.style.height = 20 + 'px';
        memitemElement.appendChild(copyButton);
        memitemElement.appendChild(editButton);
    });
    

    for (var i = 0; i < memitemElements.length; ++i) {
        if (memitemElements[i].children.length <= 4) {
            memitemElements[i].style.minHeight = '35px'; 
        }
    }
    

    const copyButton = new CopyButton();
};
