const express = require('express');
var cors = require('cors');
const app = express();
const bodyParser = require("body-parser");
const SQLHandler = require('./sql.handler');
const sqlHandlerObj = new SQLHandler();

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.get('/get_data', async (req, res, next) => {
    await sqlHandlerObj.execProc(req, res);
});

app.post('/post_data', async (req, res) => {
    await sqlHandlerObj.execProcPost(req, res);
});

app.listen(3000);