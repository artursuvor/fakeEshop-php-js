const loginForm = document.getElementById('loginForm');
loginForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    fetch('../backend/login.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            username: username,
            password: password
        })
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            if (data.message) {
                localStorage.setItem('user', JSON.stringify({
                    username: data.username,
                    role: data.role
                }));

                alert(`Welcome ${data.username}`);
            } else if (data.error) {
                alert(data.error);
            }
        })
        .catch(error => console.error('Error:', error));
});

document.addEventListener('DOMContentLoaded', () => {
    const user = JSON.parse(localStorage.getItem('user'));
    if (user) {
        alert(`Welcome back, ${user.username}`);
    }
});

document.addEventListener('DOMContentLoaded', () => {
    const user = JSON.parse(localStorage.getItem('user'));
    const loginForm = document.getElementById('loginForm');
    const logoutButton = document.getElementById('logoutButton');
    const loginMessage = document.getElementById('loginMessage');

    if (user) {
        loginForm.style.display = 'none';
        logoutButton.style.display = 'block';
        loginMessage.textContent = `Welcome, ${user.username} (${user.role})`;
    } else {
        loginForm.style.display = 'block';
        logoutButton.style.display = 'none';
    }

    logoutButton.addEventListener('click', () => {
        localStorage.removeItem('user');
        alert('You have logged out');
        location.reload(); 
    });
});
