// Function to check login status
function checkLogin(event) {
    event.preventDefault(); // Prevent the default action of the link

    // Check if the user is logged in
    if (!sessionStorage.getItem('userId')) {
        // If not logged in, display the login overlay
        showLoginOverlay();
    } else {
        // If logged in, redirect to the "Get Recommendations" page
        window.location.href = 'formCat.html'; 
    }
}

// Function to display the login overlay
function showLoginOverlay() {
    // Create overlay element
    var overlay = document.createElement('div');
    overlay.classList.add('overlay');

    // Add message to the overlay
    var message = document.createElement('div');
    message.classList.add('message');
    message.innerHTML = `
        <p>Anda harus login terlebih dahulu!</p>
        <button onclick="redirectToLogin()">Login</button>
    `;

    overlay.appendChild(message);

    // Add overlay to the body
    document.body.appendChild(overlay);
}

// Function to redirect to the login page
function redirectToLogin() {
    // Redirect to the login page
    window.location.href = 'login.html';
}
