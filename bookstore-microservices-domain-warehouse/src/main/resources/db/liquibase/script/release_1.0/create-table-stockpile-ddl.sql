CREATE TABLE stockpile
(
    id         INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amount     INTEGER,
    frozen     INTEGER,
    product_id INTEGER UNSIGNED,
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE
) engine = InnoDB;