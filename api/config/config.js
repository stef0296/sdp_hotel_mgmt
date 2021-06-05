const sqlConfig = {
    server: '11015950.database.windows.net',
    user: 'stef',
    password: 'Root@103!)#',
    database: 'sdp_hotel_mgmt',
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 3000,
    },
    options: {
        encrypt: true,
        trustServerCertificate: false,
    }
};

module.exports = sqlConfig;