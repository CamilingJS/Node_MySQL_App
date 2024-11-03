const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');
require('dotenv').config();

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// let q = "SELECT COUNT(*) AS users_count FROM users";
// let q = 'INSERT INTO users (email) VALUES ("autumnf@gmail.com")'; 
// connection.query(q, function(error, results, fields){
//     if(error) throw error;
//     console.log(results)
// });

// connection.end();

// let person = {email: faker.internet.email()};
// connection.query('INSERT INTO users SET ?', person, function(error, results){
//   if(error) throw error;
//   console.log(results);
// });

// connection.end();

// Inserting lots of data:
let data = [];

for (let i=0; i<500; i++){
  data.push([
    faker.internet.email(),
    faker.date.past()
  ]); 
}

let q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], function(error, results){
  if(error) throw error;
  console.log(results);
});

connection.end();