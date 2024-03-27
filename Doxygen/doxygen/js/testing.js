var { exec } = require('child_process');
exec('pdflatex ../latex/refman.tex', function(err, stdout, stderr) {
    if (err) console.error(stderr);
    else console.log("Generated");
});

