const express = require('express');
const path = require('path');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const session = require('express-session');
const request = require('request');
const saltRounds = 10;

const app = express();
const port = 3000;

app.use(express.json());

// Create a MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'kucingku'
});

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));
app.use('/js', express.static(path.join(__dirname, 'public/js')));
app.use('/assets', express.static(path.join(__dirname, 'public/assets')));

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

// Middleware function to check if user is logged in
function requireLogin(req, res, next) {
    if (req.session && req.session.userId) {
        return next();
    } else {
        return res.redirect('/login.html');
    }
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
            console.error('Error executing query:', err);
            return res.status(500).send('Error logging in');
        }
        if (result.length > 0) {
            // Compare the provided password with the hashed password
            bcrypt.compare(password, result[0].PASSWORD, (err, bcryptResult) => {
                if (err) {
                    console.error('Error comparing passwords:', err);
                    return res.status(500).send('Error logging in');
                }
                if (bcryptResult) {
                    // Store user ID in session     
                    req.session.userId = result[0].id;

                    // Redirect to the welcome page upon successful login
                    res.redirect('/welcome.html');
                    console.log(req.session);
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

// Add this endpoint to your existing backend code
app.get('/get-user-id', (req, res) => {
    if (req.session.userId) {
        res.json({ userId: req.session.userId });
    } else {
        res.status(401).json({ error: 'User not logged in' });
    }
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
            // Redirect to result.html after successful submission
            res.redirect('/result.html');
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

app.get('/result/user', requireLogin, (req, res) => {
    if (!req.session.userId) {
        return res.status(401).send('Unauthorized');
    }

    console.log(`Fetching data for user ID: ${req.session.userId}`);

    pool.query('SELECT * FROM user WHERE id = ?', [req.session.userId], (err, userResult) => {
        if (err) {
            console.error('Error fetching user data:', err);
            return res.status(500).send('Error fetching user data');
        }

        console.log('User data fetched:', userResult);

        if (userResult.length > 0) {
            pool.query('SELECT * FROM cat_preference WHERE user_id = ?', [req.session.userId], (err, catPreferenceResult) => {
                if (err) {
                    console.error('Error fetching cat preference data:', err);
                    return res.status(500).send('Error fetching cat preference data');
                }

                console.log('Cat preference data fetched:', catPreferenceResult);

                if (catPreferenceResult.length > 0) {
                    const user = userResult[0];
                    const catPreference = catPreferenceResult[0];

                    const requestDataUser = {
                        Userlocation: user.userlocation,
                        Userage: user.userage,
                        Usergender: user.usergender,
                    };

                    new Promise((resolve, reject) => {
                        request.post({
                            url: 'http://127.0.0.1:8000/predict_user',
                            json: requestDataUser
                        }, (err, response, body) => {
                            if (err) {
                                console.error('Error calling recommender system for user:', err);
                                return reject('Error calling recommender system for user');
                            }

                            if (response.statusCode === 200) {
                                resolve(body.recommended_cat_clusters);
                            } else {
                                reject(`Error fetching recommendations for user: ${response.statusCode}`);
                            }
                        });
                    })
                    .then(recommendedCatClustersUser => {
                        const placeholdersUser = recommendedCatClustersUser.map(() => '?').join(',');
                        const queryUser = `SELECT id, nama_kucing, jenis_kelamin, umur, warna, lokasi, status_vaksinasi, FotoKucing, ClusterKucing FROM cats WHERE ClusterKucing IN (${placeholdersUser})`;

                        pool.query(queryUser, recommendedCatClustersUser, (errUser, catResultsUser) => {
                            if (errUser) {
                                console.error('Error fetching recommended cats for user:', errUser);
                                return res.status(500).send('Error fetching recommended cats for user');
                            }

                            res.json(catResultsUser);
                        });
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        res.status(500).send('Error fetching recommendations');
                    });
                } else {
                    res.status(404).send('Cat preference data not found');
                }
            });
        } else {
            res.status(404).send('User data not found');
        }
    });
});

app.get('/result/cat', requireLogin, (req, res) => {
    // Check if user is authenticated
    if (!req.session.userId) {
        return res.status(401).send('Unauthorized');
    }

    console.log(`Fetching data for user ID: ${req.session.userId}`);

    // Query to fetch the latest cat preferences for the user
    const query = `
        SELECT jenis_kelamin, usia, warna, vaksinasi
        FROM cat_preference
        WHERE user_id = ?
        ORDER BY created_at DESC
        LIMIT 1
    `;

    pool.query(query, [req.session.userId], (err, catPreferenceResult) => {
        if (err) {
            console.error('Error fetching cat preference data:', err);
            return res.status(500).send('Error fetching cat preference data');
        }

        console.log('Cat preference data fetched:', catPreferenceResult);

        if (catPreferenceResult.length > 0) {
            const catPreference = catPreferenceResult[0];

            // Prepare request data for the recommender system
            const requestDataCat = {
                Jenis_Kelamin: catPreference.jenis_kelamin,
                Umur: catPreference.usia,
                Warna: catPreference.warna,
                Status_Vaksinasi: catPreference.vaksinasi
            };

            // Call the recommender system API to get recommended cat clusters
            request.post({
                url: 'http://127.0.0.1:8000/predict_cat',
                json: requestDataCat
            }, (err, response, body) => {
                if (err) {
                    console.error('Error calling recommender system for cats:', err);
                    return res.status(500).send('Error calling recommender system for cats');
                }

                if (response.statusCode === 200) {
                    // Handle both cases: single cluster or multiple clusters recommended
                    const recommendedCatClustersCat = Array.isArray(body.recommended_cat_clusters)
                        ? body.recommended_cat_clusters
                        : [body.recommended_cat_clusters];

                    // Generate placeholders for recommended cat clusters in SQL query
                    const placeholdersCat = recommendedCatClustersCat.map(() => '?').join(',');
                    const queryCat = `
                        SELECT id, nama_kucing, jenis_kelamin, umur, warna, lokasi, status_vaksinasi, FotoKucing, ClusterKucing
                        FROM cats
                        WHERE ClusterKucing IN (${placeholdersCat})
                    `;

                    // Fetch cats based on recommended clusters from the database
                    pool.query(queryCat, recommendedCatClustersCat, (errCat, catResultsCat) => {
                        if (errCat) {
                            console.error('Error fetching recommended cats:', errCat);
                            return res.status(500).send('Error fetching recommended cats');
                        }

                        // Send the fetched cat results as JSON response
                        res.json(catResultsCat);
                    });
                } else {
                    res.status(500).send(`Error fetching recommendations for cats: ${response.statusCode}`);
                }
            });
        } else {
            res.status(404).send('Cat preference data not found');
        }
    });
});

// Serve cat image from local folder
app.get('/cat-image/:id', (req, res) => {
    const catId = req.params.id;

    pool.query('SELECT FotoKucing FROM cats WHERE id = ?', [catId], (err, result) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).send('Error fetching image');
        }
        if (result.length > 0) {
            const imagePath = path.join(__dirname, result[0].FotoKucing);
            if (fs.existsSync(imagePath)) {
                res.sendFile(imagePath);
            } else {
                res.status(404).send('Image not found');
            }
        } else {
            res.status(404).send('Image not found');
        }
    });
});

// Handle rating-submission
app.post('/submit-rating', (req, res) => {
    const { user_id, cat_id, ClusterKucing, Rating } = req.body;

    if (!user_id || !cat_id || !ClusterKucing || !Rating) {
        return res.status(400).send('Bad Request: Missing required fields');
    }

    const query = 'INSERT INTO rating (user_id, cat_id, ClusterKucing, Rating, created_at) VALUES (?, ?, ?, ?, NOW())';

    pool.query(query, [user_id, cat_id, ClusterKucing, Rating], (err, results) => {
        if (err) {
            console.error('Error inserting rating:', err);
            return res.status(500).send('Internal Server Error');
        }
        // Redirect to welcome.html with a gratitude message
        res.redirect(`/welcome.html?message=Terima%20Kasih%!`);
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
