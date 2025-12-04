CREATE TABLE IF NOT EXISTS account
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    username  VARCHAR(50),
    password  VARCHAR(100),
    name      VARCHAR(50),
    avatar    VARCHAR(100),
    telephone VARCHAR(20),
    email     VARCHAR(100),
    location  VARCHAR(100)
); $$

/*CREATE UNIQUE INDEX account_user ON account (username);
CREATE UNIQUE INDEX account_telephone ON account (telephone);
CREATE UNIQUE INDEX account_email ON account (email);*/

CREATE OR REPLACE PROCEDURE create_index_if_not_exists()
begin
    declare v_cnt INT;
    SELECT 'Checking if INDEX ACCOUNT_USER exists...' AS log_message;
    SELECT COUNT(*)
    INTO v_cnt
    FROM information_schema.statistics
    WHERE upper(table_schema) = 'BOOKSTORE'
      AND upper(table_name) = 'ACCOUNT'
      AND upper(index_name) = 'ACCOUNT_USER';
    if v_cnt=0 then
        CREATE UNIQUE INDEX ACCOUNT_USER ON account (username);
        SELECT 'INDEX ACCOUNT_USER does not exist. Created successfully...' AS log_message;
    else
        SELECT 'INDEX ACCOUNT_USER exists...' AS log_message;
    end if;

    SELECT 'Checking if INDEX ACCOUNT_TELEPHONE exists...' AS log_message;
    SELECT COUNT(*)
    INTO v_cnt
    FROM information_schema.statistics
    WHERE upper(table_schema) = 'BOOKSTORE'
      AND upper(table_name) = 'ACCOUNT'
      AND upper(index_name) = 'ACCOUNT_TELEPHONE';
    if v_cnt=0 then
        CREATE UNIQUE INDEX ACCOUNT_TELEPHONE ON account (username);
        SELECT 'INDEX ACCOUNT_TELEPHONE does not exist. Created successfully...' AS log_message;
    else
        SELECT 'INDEX ACCOUNT_TELEPHONE exists...' AS log_message;
    end if;

    SELECT 'Checking if INDEX ACCOUNT_EMAIL exists...' AS log_message;
    SELECT COUNT(*)
    INTO v_cnt
    FROM information_schema.statistics
    WHERE upper(table_schema) = 'BOOKSTORE'
      AND upper(table_name) = 'ACCOUNT'
      AND upper(index_name) = 'ACCOUNT_EMAIL';
    if v_cnt=0 then
        CREATE UNIQUE INDEX ACCOUNT_EMAIL ON account (username);
        SELECT 'INDEX ACCOUNT_EMAIL does not exist. Created successfully...' AS log_message;
    else
        SELECT 'INDEX ACCOUNT_EMAIL exists...' AS log_message;
    end if;
end; $$

CALL create_index_if_not_exists();



CREATE OR REPLACE PROCEDURE create_default_user_if_not_exists()
begin
    declare v_cnt INT;
SELECT 'Checking if user exists...' AS log_message;
select count(*) into v_cnt from account where username='icyfenix';
if v_cnt=0 then
        INSERT INTO account
        VALUES (1, 'icyfenix', '$2a$10$iIim4LtpT2yjxU2YVNDuO.yb1Z2lq86vYBZleAeuIh2aFXjyoMCM.', '周志明', '', '18888888888',
                'icyfenix@gmail.com', '唐家湾港湾大道科技一路3号远光软件股份有限公司');
SELECT 'User does not exist. Inserted successfully...' AS log_message;
else
SELECT 'User exists...' AS log_message;
end if;
end; $$

