CREATE TABLE specification
(
    id         INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item       VARCHAR(50),
    value      VARCHAR(100),
    product_id INTEGER UNSIGNED,
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE
) engine = InnoDB;