<?php
header("Content-Type: application/json");

// Настройка подключения к базе данных
$host = "localhost";
$db = "fakeeshop";
$user = "root";
$password = "";

// Подключение к базе данных
$conn = new mysqli($host, $user, $password, $db);

if ($conn->connect_error) {
    die(json_encode(["error" => $conn->connect_error]));
}

// Проверяем, получены ли данные через POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = $_POST['username'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // Хэшируем пароль
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Добавляем пользователя в базу данных
    $stmt = $conn->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $username, $email, $hashedPassword);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Пользователь добавлен"]);
    } else {
        echo json_encode(["success" => false, "error" => $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["error" => "Invalid request method"]);
}

$conn->close();
