CREATE DATABASE IF NOT EXISTS fakeeshop;
USE fakeeshop;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (username, email, password)
VALUES 
    ('Artur', 'artur@example.com', 'password123'),
    ('JohnDoe', 'john.doe@example.com', 'securepassword'),
    ('JaneDoe', 'jane.doe@example.com', 'mypassword');
