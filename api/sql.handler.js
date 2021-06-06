const sql = require('mssql');
const config = require('./config/config');

class SQLHandler {
    async execProc(req, res) {
        try {
            let params = req.query;
            await sql.connect(config);
            const request = new sql.Request();
            console.log(params);
            let procName = params.proc_name;
            // let param = params.proc_params == 'null' ? null : params.proc_params;
            // request.input('show_inactive', param);

            let proc_params = JSON.parse(params.proc_params);
            let keys = Object.keys(proc_params);
            if(keys.length > 0) {
                for(let key of keys) {
                    let val = proc_params[key];
                    request.input(key, val);
                }
            }
            request.execute(procName, (err, data) => {
                if (err) console.log(err);
                return res.send(data.recordsets);
            });
        } catch (err) {
            console.log(err);
        }
    }

    async execProcPost(req, res) {
        try {
            let params = req.body;
            await sql.connect(config);
            const request = new sql.Request();
            console.log(params);
            let procName = params.proc_name;
            // let param = params.proc_params == 'null' ? null : params.proc_params;
            // request.input('show_inactive', param);

            let proc_params = params.proc_params;
            let keys = Object.keys(proc_params);
            if(keys.length > 0) {
                for(let key of keys) {
                    let val = proc_params[key];
                    request.input(key, val);
                }
            }
            request.execute(procName, (err, data) => {
                if (err) console.log(err);
                return res.send(data.recordsets);
            });
        } catch (err) {
            console.log(err);
        }
    }
}

module.exports = SQLHandler;