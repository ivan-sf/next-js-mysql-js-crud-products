CREATE DATABASE productsnextjs;

use productsnextjs;

CREATE TABLE product (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(500) NOT NULL,
    price DECIMAL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

describe product;
