var mysql = require('mysql');

// Set up MySQL connection
var con = mysql.createConnection({
  host: 'localhost',
  user: 'root',  // Your MySQL username
  password: '',  // Your MySQL password
  database: 'movie_ratings'  // Your database name
});

// Connect to MySQL
con.connect(function(err) {
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    return;
  }
  //console.log('Connected!');
}); 

module.exports = con;