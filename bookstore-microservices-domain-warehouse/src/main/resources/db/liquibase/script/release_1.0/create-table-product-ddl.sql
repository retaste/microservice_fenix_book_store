CREATE TABLE product
(
    id          INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(50),
    price       DECIMAL,
    rate        FLOAT,
    description VARCHAR(8000),
    cover       VARCHAR(100),
    detail      VARCHAR(100),
    INDEX (title)
) engine = InnoDB;