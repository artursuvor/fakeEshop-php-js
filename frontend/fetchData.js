document.getElementById("fetchData").addEventListener("click", () => {
    fetch("../backend/users.php")
        .then((response) => response.json())
        .then((data) => {
            const userList = document.getElementById("userList");
            userList.innerHTML = "";
            data.forEach(user => {
                const li = document.createElement("li");
                li.textContent = `${user.username} (${user.email})`;
                userList.appendChild(li);
            });
        })
        .catch(error => console.error("Ошибка:", error));
});
