class PDFButton{
  constructor(){
    this.PDFButton = document.querySelector("#PdfButton");
    this.body = document.body
    this.PDFButton.onclick = () =>{
      var Shell = new ActiveXObject("WScript.Shell");
      Shell.Run("cmd.exe /k dir");
    };
  }
}

document.addEventListener("DOMContentLoaded", () =>{
  const pdfButton = new PDFButton();
})

