const express = require('express');
const path = require('path');
const mysql = require('mysql');
const app = express();
const port = 3000;

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'KucingKu' 
});

app.use(express.static(path.join(__dirname, '..', 'FrontEnd')));
app.use(express.urlencoded({ extended: true }));

app.post('/user_data', (req, res) => {
    const { nama, umur, lokasi } = req.body;
    console.log(`Data yang diterima: Nama: ${nama}, Umur: ${umur}, Lokasi: ${lokasi}`);
    
    pool.query('INSERT INTO user (username, userage, userlocation) VALUES (?, ?, ?)', [nama, umur, lokasi], (err, result) => {
        if (err) {
            console.error('Error executing query:', err);
            res.status(500).send('Error saving user data');
            return;
        }
        console.log('User data saved successfully');
        res.redirect('/isi_peferensi_kucing.html');
    });
});

app.post('/preference_cat', (req, res) => {
  const { jenis_kelamin, usia, warna, vaksinasi } = req.body;
  console.log(`Data yang diterima: Jenis_Kelamin: ${jenis_kelamin},Usia: ${usia}, Warna: ${warna}, Vaksinasi: ${vaksinasi}`);
  
  pool.query('INSERT INTO cat_preference (jenis_kelamin, usia, warna, vaksinasi) VALUES (?, ?, ?, ?)', [jenis_kelamin, usia, warna, vaksinasi], (err, result) => {
      if (err) {
          console.error('Error executing query:', err);
          res.status(500).send('Error saving cat preference data');
          return;
      }
      console.log('Cat preference data saved successfully');
      res.redirect('/KucingKu.html');
  });
});

// server run
app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});