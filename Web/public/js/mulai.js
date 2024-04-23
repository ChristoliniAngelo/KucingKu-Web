var startButton = document.querySelector('.content-button');

function playSound() {
    var audio = new Audio('./assets/audio/meow.mp3');
    audio.play();

    setTimeout(function () {
        audio.pause();
        audio.currentTime = 0;
        }, 2000); // 2000 milidetik = 2 detik

        setTimeout(function(){
            window.location.href = 'Login.html'
        })
    }

startButton.addEventListener('click', function () {
    playSound();
});