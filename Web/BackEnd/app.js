// buat mulai npm run start
const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, '..', 'FrontEnd')));
app.use(express.urlencoded({ extended: true }));

app.post('/user_data', (req, res) => {
    const { nama, umur, lokasi } = req.body;
    console.log(`Data yang diterima: Username: ${nama}, Umur_User: ${umur}, Lokasi: ${lokasi}`);
    // res.send('Data berhasil diterima!');
    res.redirect('/isi_peferensi_kucing.html');
});

app.post('/preference_cat', (req, res) => {
  const { jenis_kelamin, usia, warna, vaksinasi } = req.body;
  console.log(`Data yang diterima: Jenis_Kelamin_Kucing: ${jenis_kelamin}, Usia_Kucing: ${usia}, Warna_Kucing: ${warna}, Vaksinasi_Kucing: ${vaksinasi}`);
  res.redirect('/KucingKu.html');
});

// run server
app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});
