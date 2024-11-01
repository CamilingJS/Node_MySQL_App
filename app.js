const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');
require('dotenv').config();

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
  });

let q = 'SELECT * FROM test';
connection.query(q, function(error, results, fields){
    if(error) throw error;
    console.log(results[0])
});

connection.end();

  
// console.log(connection)

// console.log(results[0].time);
// console.log(results[0].date.toString());
// console.log(results[0].now.toString());