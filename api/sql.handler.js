const sql = require('mssql');
const config = require('./config/config');

class SQLHandler {
    async test(params) {
        try {
            await sql.connect(config);
            const request = new sql.Request();
            let param = params.proc_params == 'null' ? null : params.proc_params;
            request.input('show_inactive', param);
            request.execute(params.proc_name, (err, res) => {
                if (err) console.log(err);
                console.log(res);
            });
        } catch (err) {
            console.log(err);
        }
    }
}

module.exports = SQLHandler;