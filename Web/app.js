const express = require('express');
const path = require('path');
const mysql = require('mysql');
const bcrypt = require('bcrypt'); 
const saltRounds = 10; // Define salt rounds for bcrypt

const app = express();
const port = 3000;

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'kucingku'
});

app.use(express.static(path.join(__dirname, '..', 'public')));
app.use(express.urlencoded({ extended: true }));

// Route for user registration
app.post('/register', (req, res) => {
    const { nama, umur, lokasi, password } = req.body;
    
    // Hash the password
    bcrypt.hash(password, saltRounds, (err, hash) => {
        if (err) {
            console.error('Error hashing password:', err);
            res.status(500).send('Error hashing password');
            return;
        }

        // Save hashed password to the user table
        pool.query('INSERT INTO user (username, userage, userlocation, password) VALUES (?, ?, ?, ?)', [nama, umur, lokasi, hash], (err, result) => {
            if (err) {
                console.error('Error executing query:', err);
                res.status(500).send('Error saving user data');
                return;
            }
            console.log('User data saved successfully');
            res.redirect('/login.html'); // Redirect to login page after registration
        });
    });
});

// Route for user login
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    // Check username against database
    pool.query('SELECT * FROM user WHERE username = ?', [username], (err, result) => {
        if (err) {
            console.error('Error executing query:', err);
            res.status(500).send('Error authenticating user');
            return;
        }
        if (result.length > 0) {
            // Compare hashed password with input password
            bcrypt.compare(password, result[0].password, (err, bcryptResult) => {
                if (err) {
                    console.error('Error comparing passwords:', err);
                    res.status(500).send('Error authenticating user');
                    return;
                }
                if (bcryptResult) {
                    // Passwords match, redirect to preference form
                    res.redirect('/formCat/index.html');
                } else {
                    // Passwords don't match, redirect back to login page
                    res.redirect('/login.html');
                }
            });
        } else {
            // No user found, redirect back to login page
            res.redirect('/login.html');
        }
    });
});

// Server run
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
