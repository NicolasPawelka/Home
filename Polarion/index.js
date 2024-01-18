const axios = require('axios');
const { response } = require('express');

const loginUrl = 'https://polarion-dev2.newtec.zz/polarion/rest/projects/';
const username = 'SchulzM';
const password = 'GAE6ENZu7e7Mmdmnm2Tj';

const loginData = {
    username: username,
    password: password
};

axios.post(loginUrl,loginData)
    .then(response =>{
        console.log('Login Successful');
    })
    .catch(error =>{
        console.error('Login failed',error.response);
    });