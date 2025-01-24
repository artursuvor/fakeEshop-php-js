document.getElementById("addUserForm").addEventListener("submit", function (event) {
    event.preventDefault();
    const formData = new FormData(event.target);

    fetch("../backend/add_user.php", {
        method: "POST",
        body: formData,
    })
    .then(response => response.json())
    .then(data => {
        const message = document.getElementById("responseMessage");
        if (data.success) {
            message.textContent = "Пользователь успешно добавлен!";
            event.target.reset();
        } else {
            message.textContent = "Ошибка: " + (data.error || "Неизвестная ошибка");
        }
    })
    .catch(error => console.error("Ошибка:", error));
});

document.addEventListener('DOMContentLoaded', () => {
    const user = JSON.parse(localStorage.getItem('user'));
    const usernamePar = document.getElementById('usernamePar');
    const addUserSection = document.getElementById('addUserSection');

    if (user) {
        usernamePar.textContent = `${user.username} (${user.role})`;
        if (user.role === 'admin') {
            addUserSection.style.display = 'block';
        } else {
            addUserSection.style.display = 'none';
        }
    } else {
        usernamePar.textContent = 'Guest';
        addUserSection.style.display = 'none';
    }
});

