const db = require("../config/db");

const User = {
  findByEmailAndPassword: (email, password, callback) => {
    const query = "SELECT * FROM users WHERE email = ? AND password = ?";
    db.query(query, [email, password], callback);
  }
};

module.exports = User;