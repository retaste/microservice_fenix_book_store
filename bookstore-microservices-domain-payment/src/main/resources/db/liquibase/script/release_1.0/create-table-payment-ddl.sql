CREATE TABLE payment
(
    id           INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pay_id       VARCHAR(100),
    create_time  DATETIME,
    total_price  DECIMAL,
    expires      INTEGER          NOT NULL,
    payment_link VARCHAR(300),
    pay_state    VARCHAR(20)
) engine = InnoDB;