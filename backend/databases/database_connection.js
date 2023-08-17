const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "assessment",
  port: "8889",
});

function main() {
  createDatabase()
    .then(() => {
      connectDatabase();
    })
    .catch(() => {
      console.log("Database exists");
    });
}

async function createDatabase() {
  const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "root",
    port: "8889",
  });

  return new Promise((resolve, reject) => {
    pool.getConnection((error, connection) => {
      if (error) return reject(error);

      let sql = "CREATE DATABASE assessment";
      connection.query(sql, (err, data) => {
        if (err) return reject(err);
        connection.release();
        connection.changeUser({ database: "mydb" });
        console.log("Create assessment database successfully!");
        resolve();
      });
    });
  });
}

async function connectDatabase() {
  await connection.connect((err) => {
    if (err) {
      console.log("Error connection to MySQL database = ", err);
      return;
    } else {
      console.log("connect to MySQL Successfully!");

      let sql =
        "CREATE TABLE users (id INT AUTO_INCREMENT NOT NULL" +
        ", name VARCHAR(255), email VARCHAR(255), phone_number VARCHAR(255)" +
        ", address VARCHAR(255), province VARCHAR(255), postal_code INT" +
        ", country VARCHAR(255), primary key (id))";
      connection.query(sql, (error, result) => {
        if (error) return;
        console.log("users table is created successfully!");
      });
    }
  });
}

main();

module.exports = connection;
