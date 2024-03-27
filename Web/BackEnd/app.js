const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: false }));

app.get('/data_user_page1', (req, res) => {
  res.send('Formulir halaman pertama');
});

app.post('/data_user_page1', (req, res) => {
  const { nama, umur, lokasi } = req.body;
  console.log('Data dari halaman pertama:', nama, umur, lokasi);
  res.redirect('/data_user_page2');
});

// Halaman kedua
app.get('/data_user_page2', (req, res) => {
  res.send('Formulir halaman kedua');
});


app.post('/data_user_page2', (req, res) => {
  const { jenis_kelamin, usia, warna, vaksinasi } = req.body;
  console.log('Data dari halaman kedua:', jenis_kelamin, usia, warna, vaksinasi);
  res.send('Data diterima dari halaman kedua');
});


app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});
