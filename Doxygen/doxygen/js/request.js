 const axios = require('axios');

 const serverURL = 'http://localhost:5000';

axios.get(`${serverURL}/PDF`)
     .then(response => {
         // console.log('Response:', response.data);
         console.log("success")
     })
     .catch(error => {
         console.error('Error:', error.message);
    });


