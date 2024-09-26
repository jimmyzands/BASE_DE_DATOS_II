-- Crear tabla Category
CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Crear tabla Product
CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

-- Crear tabla Food
CREATE TABLE Food (
    product_id INT PRIMARY KEY,
    expiration_date DATE,
    calories INT,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

-- Crear tabla Furniture
CREATE TABLE Furniture (
    product_id INT PRIMARY KEY,
    manufacture_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

-- Crear tabla Order
CREATE TABLE `Order` (
    id INT PRIMARY KEY AUTO_INCREMENT
);

-- Crear tabla order_line
CREATE TABLE order_line (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

-- Insertar datos en Category
INSERT INTO Category (name) VALUES ('Food'), ('Furniture');

-- Insertar datos en Product
INSERT INTO Product (name, price, category_id) VALUES 
('Apple', 0.5, 1),
('Chair', 50.0, 2);

-- Insertar datos en Food
INSERT INTO Food (product_id, expiration_date, calories) VALUES 
(1, '2024-12-31', 95);

-- Insertar datos en Furniture
INSERT INTO Furniture (product_id, manufacture_date) VALUES 
(2, '2024-09-15');

-- Insertar datos en Order
INSERT INTO `Order` () VALUES ();

-- Insertar datos en order_line
INSERT INTO order_line (order_id, product_id, quantity) VALUES 
(1, 1, 5),
(1, 2, 1);

-- Ejemplo de actualización (UPDATE)
UPDATE Product SET price = 0.6 WHERE id = 1;

-- Ejemplo de eliminación (DELETE)
DELETE FROM order_line WHERE order_id = 1 AND product_id = 2;
