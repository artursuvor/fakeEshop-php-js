## Requirements

- **XAMPP** (or a similar local server with PHP and MySQL support)
- **Node.js** and **npm**

---

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/artursuvor/fakeEshop-php-js
   cd fakeeshop-php-js
   ```

2. **Set up MySQL**:
   - Create a database called `fakeeshop`.
   - Import the database structure from `database/setup.sql` or manually create the `users` table:
     ```sql
     CREATE TABLE users (
         id INT AUTO_INCREMENT PRIMARY KEY,
         username VARCHAR(50) NOT NULL,
         email VARCHAR(100) NOT NULL,
         password VARCHAR(255) NOT NULL
     );
     ```

3. **Configure PHP**:
   - Place the project folder in the `htdocs` directory (for XAMPP).
   - Ensure PHP and MySQL are running in XAMPP.

4. **Install Node.js dependencies**:
   ```bash
   npm install
   ```

5. **Run the project**:
   - Access the frontend at:
     ```
     http://localhost/fakeeshop-php-js/frontend/index.html
     ```

## License

This project is open-source and can be freely used and modified.
