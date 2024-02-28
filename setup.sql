-- SQL commands for table creation
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    published_year INT
);

-- Insert dummy data
INSERT INTO books (title, author, published_year) VALUES
    ('Book 1', 'Author Jane', 2020),
    ('Book 2', 'Author Johnny', 2021),
    ('Book 3', 'Author Bhargav', 2022);
