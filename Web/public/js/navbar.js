function checkLogin(event) {
    event.preventDefault(); // Menghentikan aksi default dari link

    // Cek apakah user sudah login
    if (!sessionStorage.getItem('userId')) {
        // Jika belum login, tampilkan overlay
        showLoginOverlay();
    } else {
        // Jika sudah login, arahkan ke halaman formCat
        window.location.href = 'formCat.html';
    }
}

function showLoginOverlay() {
    // Buat overlay
    var overlay = document.createElement('div');
    overlay.classList.add('overlay');

    // Tambahkan pesan
    var message = document.createElement('div');
    message.classList.add('message');
    message.innerHTML = `
        <p>Anda harus login terlebih dahulu!</p>
        <button onclick="redirectToLogin()">Login</button>
    `;

    overlay.appendChild(message);

    // Tambahkan overlay ke body
    document.body.appendChild(overlay);
}

function redirectToLogin() {
    // Arahkan ke halaman login
    window.location.href = 'login.html';
}
