var startButton = document.querySelector('.content-button');

function playSound() {
    var audio = new Audio('properties/suara/shari_meow-47485.mp3'); // path audio
    audio.play();

    setTimeout(function() {
        audio.pause(); 
        audio.currentTime = 0; 
    }, 2000);
}

startButton.addEventListener('click', function() {
    playSound();
});
