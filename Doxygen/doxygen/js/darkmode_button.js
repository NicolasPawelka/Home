
class DarkModeToggle {
    constructor() {
        this.toggleButton = document.querySelector("#darkmode-button"); 
        this.body = document.body;
        this.darkMode = localStorage.getItem('darkMode') === 'true';
        this.toggleButton.onclick =  () => {
            this.darkMode = this.darkMode ? false : true;
            this.toggle();
            localStorage.setItem('darkMode',this.darkMode);
        };
        this.updateDarkMode();
    }

    toggle() {
        this.toggle_css();
        this.toggle_html();
        this.updateDarkMode();
    }
    toggle_css(){
        const fragments = document.getElementsByClassName("fragment"); 
        const ResultWindow = document.querySelector("#MSearchResultsWindow");
        const image = document.querySelector("#darkmode-button");
        const titlearea = document.querySelector("#titlearea");
        const sideNav = document.querySelector("#side-nav");
        const header = document.querySelector(".header");
        const memtile = document.getElementsByClassName("memtitle");
        const links = document.getElementsByClassName("el");
        const memberDeclaration = document.getElementsByClassName(".memItemRight");
        const memberDescription = document.getElementsByClassName("memproto")
        sideNav.style.backgroundImage = this.darkMode ? 'url("../images/background_invertiert.png")': null;
        image.style.filter = this.darkMode ? 'var( --both-button-filter-on-dark)' : 'invert(0)';
        titlearea.style.backgroundImage = this.darkMode ? 'url("../images/background_invertiert.png")': 'url("../images/titlearea_background.png")';
        titlearea.style.borderColor = this.darkMode ? '#302600' : 'white';
        ResultWindow.style.backgroundColor = this.darkMode ? 'white' : '#005da2';
        if(header != null){
        header.style.backgroundColor = this.darkMode ? 'var(--header-background-color)' : 'var(--header-background-color)';
        }
        for(var i = 0; i < fragments.length; ++i){
            fragments[i].style.filter = this.darkMode ? 'invert(1)' : 'invert(0)';
        }
        for(var i = 0; i < memtile.length; ++i){
            memtile[i].style.backgroundColor = this.darkMode ? 'var(--member-def-title-dark-background)' : 'var(--member-def-title-background)';
        }
        for(var i = 0; i < memberDeclaration.length; ++i){
            memberDeclaration[i].style.color = this.darkMode ? 'white' : 'black';
        }
        for(var i = 0; i < links.length; ++i){
            links[i].style.color = this.darkMode ? 'white' : 'black';
        }
        for(var i = 0; i < memberDescription.length; i++){
            memberDescription[i].style.backgroundColor = this.darkMode ? 'var(--member-def-dark-background-color)' : 'var(--member-def-light-background-color)';
        }
    }

    toggle_html(){
        const htmlElement = document.querySelector('html');
        htmlElement.style.setProperty('--page-background-color', this.darkMode ? 'var(--page-background-dark)' : 'var(--page-background-color)');
        htmlElement.style.setProperty('--page-foreground-color',this.darkMode ? 'white' : 'black');
        htmlElement.style.setProperty('--memdecl-background-color',this.darkMode ? 'black' : '#F9FAFC');
        htmlElement.style.setProperty('--memdef-proto-background-color', this.darkMode ? 'var(--member-def-dark-background)': 'var(--member-def-background-color)');
        htmlElement.style.setProperty('--memdef-doc-background-color',this.darkMode ? 'black' : 'white');
        htmlElement.style.setProperty('--memdef-param-name-color',this.darkMode ? 'white' : '#602020');
        htmlElement.style.setProperty('--memdef-proto-text-color',this.darkMode ? 'white' : '#253555');
        htmlElement.style.setProperty('--memdef-border-color',this.darkMode ? 'white' : '#A8B8D9');
        htmlElement.style.setProperty('--memdecl-seperator-color',this.darkMode ? 'white' : '#DEE4F0');
        htmlElement.style.setProperty('--page-visited-link-color' , this.darkMode ? '#0076BD' : '#4665A2');
        htmlElement.style.setProperty('--memdecl-foreground-color' , this.darkMode ? 'white' : '#555');
        htmlElement.style.setProperty('--memdef-title-background-color',this.darkMode ? 'black' : '#E2E8F2');
        htmlElement.style.setProperty('--group-header-color',this.darkMode ? 'white' : '#555555');
        htmlElement.style.setProperty('--projectnumber-color', this.darkMode ? 'white' : 'black');
        htmlElement.style.setProperty('--slogan-color', this.darkMode ? 'white' : 'black');
        htmlElement.style.setProperty('--class-list-background-color-even', this.darkMode ? 'var(--class-list-dark-background-color-even)' : 'var(--class-list-background-color-even)');
        htmlElement.style.setProperty('--class-list-background-color-odd', this.darkMode ?  'var(--class-list-dark-background-color-odd)': 'var(--class-list-background-color-odd)');
        htmlElement.style.setProperty('--class-list-color' , this.darkMode ? 'var(--class-list-dark-color)' : 'var(--class-list-color)' );
        htmlElement.style.setProperty('--class-index-background-color-odd', this.darkMode ?  'var(--class-index-dark-background-color-odd)' : 'var(--class-index-background-color-odd)');
        htmlElement.style.setProperty('--class-index-background-color-even', this.darkMode ? 'var(--class-index-dark-background-color-even)' : 'vat(--class-index-background-color-even)');
        htmlElement.style.setProperty('--class-index-letter', this.darkMode ? 'var(--class-index-dark-letter)' : 'var(--class-index-letter)');
        htmlElement.style.setProperty('--class-index', this.darkMode ? 'var(--class-index-dark)' : 'var(--class-index)');
    }
    

    updateDarkMode() {
        if (this.darkMode) {
            this.body.classList.add("dark-mode");
        } else {
            this.body.classList.remove("dark-mode");
        }
    }
}
function setDarkMode(isDarkMode){
    localStorage.setItem('darkMode',isDarkMode);
}
document.addEventListener("DOMContentLoaded", () => {
    const darkModeToggle = new DarkModeToggle();
    localStorage.getItem('darkMode') ? darkModeToggle.toggle() : null;
})



