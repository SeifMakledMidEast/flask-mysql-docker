CREATE DATABASE IF NOT EXISTS bucketlist;
USE bucketlist;

CREATE TABLE IF NOT EXISTS tbl_user (
    user_id BIGINT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(45) NOT NULL,
    user_username VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE KEY uq_tbl_user_username (user_username)
);

DROP PROCEDURE IF EXISTS sp_createUser;
DROP PROCEDURE IF EXISTS sp_validateLogin;

DELIMITER //

CREATE PROCEDURE sp_createUser(
    IN p_name VARCHAR(45),
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    IF EXISTS (SELECT 1 FROM tbl_user WHERE user_username = p_username) THEN
        SELECT 'Username Exists !!' AS message;
    ELSE
        INSERT INTO tbl_user (user_name, user_username, user_password)
        VALUES (p_name, p_username, p_password);
    END IF;
END//

CREATE PROCEDURE sp_validateLogin(IN p_username VARCHAR(255))
BEGIN
    SELECT user_id, user_name, user_username, user_password
    FROM tbl_user
    WHERE user_username = p_username;
END//

DELIMITER ;
