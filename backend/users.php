<?php
header("Content-Type: application/json");
$host = "localhost";
$db = "fakeeshop";
$user = "root";
$password = "";

$conn = new mysqli($host, $user, $password, $db);

if ($conn->connect_error) {
    die(json_encode(["error" => $conn->connect_error]));
}

$sql = "SELECT id, username, email FROM users";
$result = $conn->query($sql);

$users = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
}

$conn->close();
echo json_encode($users);
