function checkUserSession() {
    // Check if the user's session is stored
    return !!sessionStorage.getItem('userId');
}

function checkLogin(event) {
    event.preventDefault(); // Prevent the default action of the link

    // Check if the user is logged in
    if (!checkUserSession()) {
        // If not logged in, display the login overlay
        showLoginOverlay();
    } else {
        // If logged in, redirect to the formCat page
        window.location.href = 'formCat.html';
    }
}

function showLoginOverlay() {
    // Create overlay
    var overlay = document.createElement('div');
    overlay.classList.add('overlay');

    // Add message
    var message = document.createElement('div');
    message.classList.add('message');
    message.innerHTML = `
        <p>You must log in first!</p>
        <button onclick="redirectToLogin()">Login</button>
    `;

    overlay.appendChild(message);

    // Add overlay to the body
    document.body.appendChild(overlay);
}

function redirectToLogin() {
    // Redirect to the login page
    window.location.href = 'login.html';
}

// Check user session when the page loads
window.addEventListener('load', function() {
    if (checkUserSession()) {
        // If the user is logged in, update any UI accordingly
        console.log('User is logged in');
    } else {
        console.log('User is not logged in');
    }
});
