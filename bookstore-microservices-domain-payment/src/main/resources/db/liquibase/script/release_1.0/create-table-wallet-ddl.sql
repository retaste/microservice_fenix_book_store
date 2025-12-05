CREATE TABLE wallet
(
    id         INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    money      DECIMAL,
    account_id INTEGER UNSIGNED
) engine = InnoDB;