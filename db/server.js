const Firebird = require('node-firebird');
const express = require('express');
const cors = require('cors');
const path = require('path');

const app = express();
const port = 3000;

app.use(cors());

const options = {
    host: 'localhost',
    port: 3050, 
    // No caso tem que colocar o caminho inteiro ou não funciona
    // database: 'C:\\Users\\kaua_\\projects-workspace\\ifood-flutter\\db\\DB.FDB',
    database: path.join(__dirname, 'DB.FDB'),
    user: 'SYSDBA',
    password: '0305'
};


app.get('/restaurantes', (req, res) => {
    Firebird.attach(options, function(err, db) {
        if (err) throw err;

        db.query('select * from Restaurantes', function(err, result) {
            if (err) throw err;

            res.json(result);
            db.detach();
        });
    });
});



app.listen(port, () => {
    console.log(`Servidor do DB iniciado em http://localhost:${port}`);
});