CREATE DATABASE drinking_store;
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE drinking_store;

CREATE TABLE drinks (
 id INT NOT NULL AUTO_INCREMENT,
 drink_name VARCHAR(255) NOT NULL,
 price INT NOT NULL,
 cost INT NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE customers (
 id INT NOT NULL AUTO_INCREMENT,
 customer_name VARCHAR(255) NOT NULL,
 phone VARCHAR(255),
 birthdate Datetime,
 PRIMARY KEY (id)
);

CREATE TABLE orders (
 id INT NOT NULL AUTO_INCREMENT,
 drinks_id INT NOT NULL,
 customers_id INT NOT NULL,
 quantity INT NOT NULL,
 create_at TIMESTAMP NOT NULL,
 PRIMARY KEY (id)
);


-- 可以在 CREATE TABLE 的時候就建立 FK , 也可以用 ALTER 增加
ALTER TABLE orders 
ADD FOREIGN KEY (drinks_id) REFERENCES drinks (id),
ADD FOREIGN KEY (customers_id) REFERENCES customers (id);

-- 如果想要改 db 的設定
ALTER DATABASE drink_store
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
--