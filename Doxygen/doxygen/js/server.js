const http = require('http');
const fs = require('fs');
const path = require('path');


const server = http.createServer((req, res) => {
 if (req.url === '/PDF') {
        const pdfFilePath = path.join(__dirname, '../latex/refman.pdf');

        fs.readFile(pdfFilePath, (err, data) => {
            if (err) {
                console.error('Error reading PDF file:', err);
                res.statusCode = 500;
                res.end('Internal Server Error');
            } else {
                res.setHeader('Content-Disposition', 'attachment; filename=file.pdf');
                res.setHeader('Content-Type', 'application/pdf');


                res.end(data);
            }
        });
    } else {
        res.end(server.statusCode);
    }
});

const PORT = 5000;
server.listen(PORT, () => {
    console.log(`Node.js erreichbar auf http://localhost:${PORT}`);
    console.log("Drücken Sie eine beliebige Taste...");
});
