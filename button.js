// Mendapatkan referensi tombol "Mulai!"
var startButton = document.querySelector('.content-button');

// Mendefinisikan fungsi untuk memainkan suara
function playSound() {
    var audio = new Audio('properties/suara/shari_meow-47485.mp3'); // Perbarui path audio
    audio.play();

    // Memberhentikan pemutaran suara setelah 2 detik
    setTimeout(function() {
        audio.pause(); // Menghentikan pemutaran suara
        audio.currentTime = 0; // Mengembalikan ke awal audio
    }, 2000); // 2000 milidetik = 2 detik
}

// Menambahkan event listener untuk mendeteksi klik pada tombol "Mulai!"
startButton.addEventListener('click', function() {
    playSound();
});
