const express = require('express');
const path = require('path');
const mysql = require('mysql');
const session = require('express-session');

const app = express();
const port = 3000;

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'KucingKu' 
});

// middleware sesi
app.use(session({
    secret: 'rahasiakamu',
    resave: false,
    saveUninitialized: true
}));

app.use(express.static(path.join(__dirname, '..', 'FrontEnd')));
app.use(express.urlencoded({ extended: true }));

app.post('/user_data', (req, res) => {
    const { nama, umur, lokasi } = req.body;
    console.log(`Data yang diterima: Nama: ${nama}, Umur: ${umur}, Lokasi: ${lokasi}`);
    // simpan ke tabel user
    pool.query('INSERT INTO user (username, userage, userlocation) VALUES (?, ?, ?)', [nama, umur, lokasi], (err, result) => {
        if (err) {
            console.error('Error executing query:', err);
            res.status(500).send('Error saving user data');
            return;
        }
        console.log('User data saved successfully');
        // Setel sesi
        req.session.last_inserted_user_id = result.insertId;
        res.redirect('/isi_peferensi_kucing.html');
    });
});

app.post('/preference_cat', (req, res) => {
    if (req.session && req.session.last_inserted_user_id) {
        const { jenis_kelamin, usia, warna, vaksinasi } = req.body;
        const user_id = req.session.last_inserted_user_id;
        console.log(`Data yang diterima: Jenis_Kelamin: ${jenis_kelamin},Usia: ${usia}, Warna: ${warna}, Vaksinasi: ${vaksinasi}, User_ID: ${user_id}`);
        
        // simpan ke tabel cat_peference
        pool.query('INSERT INTO cat_preference (jenis_kelamin, usia, warna, vaksinasi, user_id) VALUES (?, ?, ?, ?, ?)', [jenis_kelamin, usia, warna, vaksinasi, user_id], (err, result) => {
            if (err) {
                console.error('Error executing query:', err);
                res.status(500).send('Error saving cat preference data');
                return;
            }
            console.log('Cat preference data saved successfully');
            res.redirect('/result.html');
        });
    } else {
        res.status(400).send('User session not initialized or user_id not set');
    }
});

// Server run
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
