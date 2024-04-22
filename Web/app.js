const express = require('express');
const path = require('path');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const saltRounds = 10;

const app = express();
const port = 3000;

// Create a MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'kucingku'
});

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));
// Parse URL-encoded bodies for form data
app.use(express.urlencoded({ extended: true }));

// Middleware function for validating user registration data
function validateRegistration(req, res, next) {
    const { username, email, password, userage, location } = req.body;

    // Check if all required fields are provided
    if (!username || !email || !password || !userage || !location) {
        return res.status(400).send('All fields are required');
    }

    next();
}

// Middleware function for validating user login data
function validateLogin(req, res, next) {
    const { username, password } = req.body;

    // Check if both username and password are provided
    if (!username || !password) {
        return res.status(400).send('Username and password are required');
    }

    next();
}

// Route for user registration
app.post('/register', validateRegistration, (req, res) => {
    const { username, email, password, userage, usergender, userlocation } = req.body;

    // Hash the password
    bcrypt.hash(password, saltRounds, (err, hash) => {
        if (err) {
            console.error('Error hashing password:', err);
            return res.status(500).send('Error hashing password');
        }

        // Insert user data into the database
        pool.query('INSERT INTO user (username, email, password, userage, usergender, userlocation, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())',
            [username, email, hash, userage, usergender, userlocation],
            (err, result) => {
                if (err) {
                    console.error('Error executing query:', err);
                    return res.status(500).send('Error saving user data');
                }
                console.log('User data saved successfully');
                // Redirect the user to the login page
                res.redirect('/login.html');
            }
        );
    });
});

// Route for user login
app.post('/login', validateLogin, (req, res) => {
    const { username, password } = req.body;

    // Query the database for the user
    pool.query('SELECT * FROM user WHERE username = ?', [username], (err, result) => {
        if (err) {
            // Log and return the actual error message from MySQL
            console.error('Error executing query:', err);
            return res.status(500).send('Error authenticating user: ' + err.message);
        }
        if (result.length > 0) {
            // Compare passwords
            bcrypt.compare(password, result[0].password, (err, bcryptResult) => {
                if (err) {
                    // Log and return the actual error message from bcrypt
                    console.error('Error comparing passwords:', err);
                    return res.status(500).send('Error authenticating user: ' + err.message);
                }
                if (bcryptResult) {
                    // Redirect to the cat preference form upon successful login
                    res.redirect('/formCat.html');
                } else {
                    // Render login page with notification for incorrect credentials
                    res.render('login', { error: 'Incorrect username or password' });
                }
            });
        } else {
            // Render login page with notification for incorrect credentials
            res.render('login', { error: 'Incorrect username or password' });
        }
    });
});

// Route for handling cat preference form submission
app.post('/catpreference', (req, res) => {
    const { jenis_kelamin, usia, warna, vaksinasi } = req.body;

    // Check if all required fields are filled
    if (!jenis_kelamin || !usia || !warna || !vaksinasi) {
        return res.status(400).send('Please fill in all required fields');
    }

    // Insert cat preference data into the database
    pool.query('INSERT INTO cat_preference (jenis_kelamin, usia, warna, vaksinasi) VALUES (?, ?, ?, ?)',
        [jenis_kelamin, usia, warna, vaksinasi],
        (err, result) => {
            if (err) {
                console.error('Error executing query:', err);
                return res.status(500).send('Error saving cat preference data');
            }
            console.log('Cat preference data saved successfully');
            // Send a success response to the client
            res.status(200).send('Cat preference form submitted successfully!');
        });
});

// Start the server
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
