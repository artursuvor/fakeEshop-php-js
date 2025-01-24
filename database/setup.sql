CREATE DATABASE IF NOT EXISTS fakeeshop;
USE fakeeshop;

CREATE TABLE `categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', '2025-01-23 08:52:53', '2025-01-23 08:52:53'),
(2, 'Clothing', '2025-01-23 08:52:53', '2025-01-23 08:52:53'),
(3, 'Books', '2025-01-23 08:52:53', '2025-01-23 08:52:53'),
(4, 'Furniture', '2025-01-23 08:52:53', '2025-01-23 08:52:53'),
(5, 'Toys', '2025-01-23 08:52:53', '2025-01-23 08:52:53');

CREATE TABLE `products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `stock` INT(11) DEFAULT 0,
  `category_id` INT(11) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Smartphone XYZ', 'Powerful smartphone with a 6.5-inch display and 128GB storage.', 29999.99, 50, 1, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(2, 'Laptop Pro 15', 'Laptop with an i7 processor and 16GB of RAM.', 79999.00, 20, 1, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(3, 'White T-Shirt', 'Classic white T-shirt made from 100% cotton.', 499.99, 200, 2, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(4, 'Blue Jeans', 'Trendy blue jeans made from durable fabric.', 2499.00, 100, 2, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(5, 'Book "Python Programming"', 'Beginner-friendly textbook on Python programming.', 899.00, 70, 3, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(6, 'Baby Crib', 'Comfortable crib for your baby.', 5999.00, 10, 4, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(7, 'Toy Car', 'Bright toy car for kids aged 3 and up.', 299.00, 150, 5, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(8, 'Gaming Console XYZ', 'Next-gen console for 4K gaming.', 49999.00, 30, 1, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(9, 'Red Dress', 'Elegant evening dress.', 3499.00, 40, 2, '2025-01-23 08:52:59', '2025-01-23 08:52:59'),
(10, 'Wardrobe', 'Wooden wardrobe with sliding doors.', 19999.00, 5, 4, '2025-01-23 08:52:59', '2025-01-23 08:52:59');

CREATE TABLE `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('user', 'admin') DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'Artur', 'artur@example.com', '$2y$10$lZ1AWkZ9MbNyN28SwFArVO.hme/52J1kao7qtKWxob726408Sm9nO', 'user'),
(2, 'JohnDoe', 'john.doe@example.com', '$2y$10$lZ1AWkZ9MbNyN28SwFArVO.hme/52J1kao7qtKWxob726408Sm9nO', 'user'),
(3, 'JaneDoe', 'jane.doe@example.com', '$2y$10$lZ1AWkZ9MbNyN28SwFArVO.hme/52J1kao7qtKWxob726408Sm9nO', 'user'),
(4, 'Createor', 'creatir@ex.co', '$2y$10$lZ1AWkZ9MbNyN28SwFArVO.hme/52J1kao7qtKWxob726408Sm9nO', 'user'),
(5, 'admin', 'admin@admin.com', '$2y$10$lZ1AWkZ9MbNyN28SwFArVO.hme/52J1kao7qtKWxob726408Sm9nO', 'admin');
