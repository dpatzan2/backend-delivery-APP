CREATE DATABASE IF NOT EXISTS udemy_delivery;
USE udemy_delivery;


CREATE TABLE IF NOT EXISTS users(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(180) NOT NULL UNIQUE,
	name VARCHAR(90) NOT NULL,
	lastnmae VARCHAR(90) NOT NULL,
	phone VARCHAR(90) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	password VARCHAR(90) NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

CREATE TABLE IF NOT EXISTS roles(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(90) NOT NULL UNIQUE,
    image VARCHAR(255) NULL,
    route VARCHAR(180) NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_has_roles(
	id_user BIGINT NOT NULL,
    id_rol BIGINT NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
    FOREIGN KEy(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEy(id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_user, id_rol)
);

CREATE TABLE IF NOT EXISTS categories(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);


CREATE TABLE IF NOT EXISTS products(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(180) NOT NULL UNIQUE,
	description TEXT NOT NULL,
    price DECIMAL NOT NULL,
    image1 VARCHAR(255) NOT NULL,
    image2 VARCHAR(255) NOT NULL,
    image3 VARCHAR(255) NOT NULL,
    id_category BIGINT NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
    FOREIGN KEY (id_category) REFERENCES categories(id) ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO roles (name, route, created_at, updated_at) VALUES ('RESTAURANTE', '/restaurant/orders/list', '2022-05-30', '2022-05-30');
INSERT INTO roles (name, route, created_at, updated_at) VALUES ('REPARTIDOR', '/delivery/orders/list', '2022-05-30', '2022-05-30');
INSERT INTO roles (name, route, created_at, updated_at) VALUES ('CLIENTE', '/client/products/list', '2022-05-30', '2022-05-30');