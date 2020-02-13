/* Удаляем базу если она существует */
DROP DATABASE IF EXISTS example;
/* Создаем базу данных example */
CREATE DATABASE example;
USE example;
/* Создаем таблицу users */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	users_id INT NOT NULL AUTO_INCREMENT COMMENT "Первичный ключ",
	name VARCHAR(255) NULL COMMENT "Имя пользователя",
	PRIMARY KEY (users_id)
	) COMMENT "Пользователи";