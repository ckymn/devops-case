//Database Connection
const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "devopscaserdsinstance.ceqs6zm6zfiu.us-east-1.rds.amazonaws.com",
  user: "devops_case",
  password: "devops_case",
  database: "innodb",
});

connection.connect((error) => {
  if (error) {
    console.error("Error connecting to the database: ", error);
  } else {
    console.log("Connected to the database");
  }
});

module.exports = connection;
