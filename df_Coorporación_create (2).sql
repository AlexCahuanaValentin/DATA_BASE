-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-02 00:26:27.87
drop table dbo.PRODUC
drop database db_PUNTOS

USE master;
DROP DATABASE IF EXISTS db_puntos;
CREATE DATABASE db_puntos;
USE db_puntos;
-- tables
-- Table: client
CREATE TABLE client (
    id char(6)  NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(90)  NOT NULL,
    type_document char(3)  NOT NULL,
    number_document char(10)  NOT NULL,
    cell_phone char(9)  NOT NULL,
    email varchar(90)  NULL,
    state char(1)  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY  (id)
);

-- Table: historial
CREATE TABLE historial (
    id int  NOT NULL,
    code varchar(15)  NULL,
    points decimal(8,2)  NOT NULL,
    state char(1)  NOT NULL,
    state_delivery char(1)  NULL,
    state_points char(1)  NOT NULL,
    product_code char(6)  NOT NULL,
    seller_id int  NOT NULL,
    client_id char(6)  NOT NULL,
    CONSTRAINT historial_pk PRIMARY KEY  (id)
);

-- Table: product
CREATE TABLE product (
    id char(6),
	name varchar(20),
    description varchar(900),
	points varchar(6),
    stock int,
    type varchar(30),
    brand varchar(30),
    state char(1) DEFAULT'A',
    CONSTRAINT product_pk PRIMARY KEY  (id)
);

select*from product

insert into product(id, name, description, points, stock, type, brand)
values('123456', 'celular redmi', 'tiene 8 de ram', '1500', 12, 'celular', 'xiomi');
-- Table: product_detail
CREATE TABLE product_detail (
    id int  NOT NULL,
    detail varchar(200)  NOT NULL,
    product_code char(6)  NOT NULL,
    CONSTRAINT product_detail_pk PRIMARY KEY  (id)
);

-- Table: seller
CREATE TABLE seller (
    id int  NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(90)  NOT NULL,
    address varchar(100)  NOT NULL,
    email varchar(100)  NOT NULL,
    usuario varchar(20)  NOT NULL,
    clave char(10)  NOT NULL,
    CONSTRAINT seller_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: historial_client (table: historial)
ALTER TABLE historial ADD CONSTRAINT historial_client
    FOREIGN KEY (client_id)
    REFERENCES client (id);

-- Reference: historial_product (table: historial)
ALTER TABLE historial ADD CONSTRAINT historial_product
    FOREIGN KEY (product_code)
    REFERENCES product (code);

-- Reference: historial_seller (table: historial)
ALTER TABLE historial ADD CONSTRAINT historial_seller
    FOREIGN KEY (seller_id)
    REFERENCES seller (id);

-- Reference: product_detail_product (table: product_detail)
ALTER TABLE product_detail ADD CONSTRAINT product_detail_product
    FOREIGN KEY (product_code)
    REFERENCES product (code);

-- End of file.

