CREATE DATABASE library_db;

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    year_published INT,
    isAvailable BOOLEAN DEFAULT TRUE,
    price DECIMAL(10,2),
    publication VARCHAR(255)
);

INSERT INTO books (title, author, year_published, isAvailable, price, publication) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, TRUE, 299.99, 'Scribner'),
('1984', 'George Orwell', 1949, TRUE, 399.50, 'Secker & Warburg'),
('To Kill a Mockingbird', 'Harper Lee', 1960, FALSE, 450.00, 'J.B. Lippincott & Co.'),
('Pride and Prejudice', 'Jane Austen', 1813, TRUE, 320.75, 'T. Egerton'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, TRUE, 380.00, 'Little, Brown'),
('Harry Potter and the Philosopher Stone', 'J.K. Rowling', 1997, TRUE, 650.00, 'Bloomsbury'),
('The Da Vinci Code', 'Dan Brown', 2003, TRUE, 520.99, 'XYZ'),
('The Alchemist', 'Paulo Coelho', 1988, TRUE, 275.50, 'HarperCollins'),
('Life of Pi', 'Yann Martel', 2001, FALSE, 425.00, 'Knopf Canada'),
('The Kite Runner', 'Khaled Hosseini', 2003, TRUE, 485.75, 'XYZ'),
('Gone Girl', 'Gillian Flynn', 2012, TRUE, 550.00, 'Crown Publishing'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 2005, TRUE, 475.25, 'XYZ'),
('The Hunger Games', 'Suzanne Collins', 2008, TRUE, 395.99, 'Scholastic'),
('Twilight', 'Stephenie Meyer', 2005, FALSE, 340.00, 'Little, Brown'),
('The Fault in Our Stars', 'John Green', 2012, TRUE, 310.50, 'Dutton Books');

SELECT * FROM books 
WHERE year_published > 2000;

SELECT * FROM books 
WHERE price < 599.00 
ORDER BY price DESC;

SELECT * FROM books 
ORDER BY price DESC 
LIMIT 3;

SELECT * FROM books 
ORDER BY year_published DESC 
LIMIT 2 OFFSET 2;

SELECT * FROM books 
WHERE publication = 'XYZ' 
ORDER BY title ASC;