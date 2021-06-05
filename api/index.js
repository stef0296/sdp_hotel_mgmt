const express = require('express');
const app = express();
const SQLHandler = require('./sql.handler');
const sqlHandlerObj = new SQLHandler();

app.get('/get_data', async (req, res) => {
    console.log(req.query);
    await sqlHandlerObj.test(req.query);
    res.send('Hello World');
});

app.post('/post_data', (req, res) => {

});

app.listen(3000);