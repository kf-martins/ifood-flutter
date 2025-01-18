/**
 * Lembrar de fazer a conexão com o isql antes, em um terminal separado
 * 
 * isql -u SYSDBA -p 0305
 */


const Firebird = require('node-firebird');
const path = require('path');


const options = {
    host: 'localhost',
    port: 3050,
    database: path.join(__dirname, '../db/DB.FDB'), // Se falhar use o caminho completo
    user: 'SYSDBA',
    password: '0305',
    WireCrypt: 'Disabled'
};

// Função para criar o banco de dados
function createDatabase() {
    Firebird.create(options, function(err, db) {
        if (err) {
            console.error('Erro ao criar o banco de dados:', err);
            return;
        }

        console.log('Banco de dados criado com sucesso.');

        const createTableQuery = `
            CREATE TABLE Restaurantes (
                ID INTEGER NOT NULL PRIMARY KEY,
                NAME VARCHAR(100) NOT NULL,
                DESC VARCHAR(250),
                ICON VARCHAR(250)
            )
        `;

        db.query(createTableQuery, function(err, result) {
            if (err) {
                console.error('Erro ao criar a tabela:', err);
                db.detach();
                return;
            }

            console.log('Tabela Restaurantes criada com sucesso.');
            db.detach();
        });
    });
}

// Testar a conexão antes de criar o banco de dados
Firebird.attach(options, function(err, db) {
    if (err) {
        console.log('Banco de dados não encontrado, criando novo banco de dados...');
        createDatabase();
    } else {
        console.log('Banco de dados já existe.');
        db.detach();
    }
});