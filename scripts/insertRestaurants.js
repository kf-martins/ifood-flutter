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

const restaurants = [
    { id: 1, name: 'McDonalds', desc: 'Fast food', icon: 'lojas/mcdonalds.png' },
    { id: 2, name: 'Burger King', desc: 'Fast food', icon: 'burgerking.png' },
    { id: 3, name: 'Subway', desc: 'Sandwiches', icon: 'subway.png' },
    { id: 4, name: 'Pizza Hut', desc: 'Pizza', icon: 'pizzahut.png' },
    { id: 5, name: 'KFC', desc: 'Fried chicken', icon: 'kfc.png' },
    { id: 6, name: 'Starbucks', desc: 'Coffee', icon: 'starbucks.png' },
    { id: 7, name: 'Dominos', desc: 'Pizza', icon: 'dominos.png' },
    { id: 8, name: 'Taco Bell', desc: 'Mexican', icon: 'tacobell.png' },
    { id: 9, name: 'Dunkin Donuts', desc: 'Donuts', icon: 'dunkindonuts.png' },
    { id: 10, name: 'Chipotle', desc: 'Mexican', icon: 'chipotle.png' }
];

function insertRestaurants() {
    Firebird.attach(options, function(err, db) {
        if (err) {
            console.error('Erro ao conectar ao banco de dados:', err);
            return;
        }

        const insertQuery = `
            INSERT INTO Restaurantes (ID, NAME, DESC, ICON)
            VALUES (?, ?, ?, ?)
        `;

        restaurants.forEach(restaurant => {
            db.query(insertQuery, [restaurant.id, restaurant.name, restaurant.desc, restaurant.icon], function(err, result) {
                if (err) {
                    console.error('Erro ao inserir restaurante:', err);
                    return;
                }

                console.log(`Restaurante ${restaurant.name} inserido com sucesso.`);
            });
        });

        db.detach();
    });
}

insertRestaurants();