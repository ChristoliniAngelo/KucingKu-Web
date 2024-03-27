var startButton = document.querySelector('.content-button');

function playSound() {
    var audio = new Audio('https://raw.githubusercontent.com/ChristoliniAngelo/KucingKu-Web/b64752e3f95645fe2ab4464ac8c58ab95ada8f47/properties/suara/shari_meow-47485.mp3'); // path audio
    audio.play();

    setTimeout(function() {
        audio.pause(); 
        audio.currentTime = 0; 
    }, 2000);
}

startButton.addEventListener('click', function() {
    playSound();
});

document.addEventListener('DOMContentLoaded', function() {
    const contentButton = document.querySelector('.content-button');
    
    contentButton.addEventListener('click', function() {
        window.location.href = 'Isi_data_user.html';
    });
});
