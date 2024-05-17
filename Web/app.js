const express = require('express');
const path = require('path');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const session = require('express-session');
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

// Initialize session middleware
app.use(session({
    secret: 'secret-key',
    resave: false,
    saveUninitialized: true
}));

// Middleware function for validating user registration data
function validateRegistration(req, res, next) {
    const { username, email, password, age, usergender, userlocation } = req.body;

    // Check if all required fields are provided
    if (!username || !email || !password || !age || !usergender || !userlocation) {
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
    const { username, email, password, age, usergender, userlocation } = req.body;

    // Hash the password
    bcrypt.hash(password, saltRounds, (err, hash) => {
        if (err) {
            console.error('Error hashing password:', err);
            return res.status(500).send('Error hashing password');
        }

        // Insert user data into the database
        pool.query('INSERT INTO user (username, email, password, userage, usergender, userlocation, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())',
            [username, email, hash, age, usergender, userlocation],
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
            // Error handling
        }
        if (result.length > 0) {
            bcrypt.compare(password, result[0].PASSWORD, (err, bcryptResult) => {
                if (err) {
                    // Error handling
                }
                if (bcryptResult) {
                    // Store user ID in session
                    req.session.userId = result[0].id;

                    // Redirect to the welcome page upon successful login
                    res.redirect('/welcome.html');
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

// Route for handling the welcome page
app.get('/welcome.html', requireLogin, (_req, res) => {
    // If user is logged in, render the welcome page
    res.sendFile(path.join(__dirname, 'public', 'welcome.html'));
});

// Route to get username
app.get('/get-username', (req, res) => {
    // Check if user is authenticated
    if (!req.session.userId) {
        return res.status(401).send('Unauthorized');
    }

    // Query the database for the username based on userId
    pool.query('SELECT username FROM user WHERE id = ?', [req.session.userId], (err, result) => {
        if (err) {
            console.error('Error fetching username:', err);
            return res.status(500).send('Error fetching username');
        }
        if (result.length > 0) {
            // Send the username as response
            res.send(result[0].username);
        } else {
            return res.status(404).send('User not found');
        }
    });
});

// Route for handling user logout
app.get('/logout', (req, res) => {
    // Destroy the session
    req.session.destroy(err => {
        if (err) {
            console.error('Error destroying session:', err);
            return res.status(500).send('Error logging out');
        }
        // Redirect to login page after logout
        res.redirect('/login.html');
    });
});

// Route for handling cat preference form submission
app.post('/catpreference', requireLogin, (req, res) => {
    // Check if user is authenticated
    if (!req.session.userId) {
        return res.status(401).send('Unauthorized');
    }

    const { jenis_kelamin, usia, warna, vaksinasi } = req.body;
    const user_id = req.session.userId; // Retrieve user_id from session

    // Check if all required fields are filled
    if (!jenis_kelamin || !usia || !warna || !vaksinasi) {
        return res.status(400).send('Please fill in all required fields');
    }

    // Insert cat preference data into the database
    pool.query('INSERT INTO cat_preference (user_id, jenis_kelamin, usia, warna, vaksinasi) VALUES (?, ?, ?, ?, ?)',
        [user_id, jenis_kelamin, usia, warna, vaksinasi],
        (err, result) => {
            if (err) {
                console.error('Error executing query:', err);
                return res.status(500).send('Error saving cat preference data');
            }
            console.log('Cat preference data saved successfully');
            // Send a success response to the client
            //res.status(200).send('Cat preference form submitted successfully!');
            //navigate to result.html
            res.redirect('/result.html')
        });
});

// Route for serving the formCat.html page
app.get('/formCat.html', (req, res) => {
    // Check if user is authenticated
    if (!req.session.userId) {
        // If user is not authenticated, redirect to the login page
        return res.redirect('/login.html');
    }

    // If user is authenticated, serve the formCat.html page
    res.sendFile(path.join(__dirname, 'public', 'formCat.html'));
});

// Middleware function to check if user is logged in
function requireLogin(req, res, next) {
    if (req.session && req.session.userId) {
        return next();
    } else {
        return res.redirect('/login.html');
    }
}

// Start the server
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});