var mysql = require('mysql');  
var con = mysql.createConnection({  
host: "localhost",  
user: "root",  
password: "12345",  
database: "javatpoint"  
});  
con.connect(function(err) {  
if (err) throw err;  
var sql = "UPDATE employees SET city = 'Delhi' WHERE city = 'Allahabad'";  
con.query(sql, function (err, result) {  
if (err) throw err;  
console.log(result.affectedRows + " record(s) updated");  
});  
});  