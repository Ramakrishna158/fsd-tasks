const User = require("../models/userModel");

exports.loginUser = (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({
      success: false,
      message: "All fields are required"
    });
  }

  User.findByEmailAndPassword(email, password, (err, results) => {
    if (err) {
      return res.status(500).json({
        success: false,
        message: "Server error"
      });
    }

    if (results.length > 0) {
      res.json({
        success: true,
        message: "Login successful"
      });
    } else {
      res.status(401).json({
        success: false,
        message: "Invalid email or password"
      });
    }
  });
};