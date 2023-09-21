create database bd_example;

use bd_example;

create table categorias (
    id_categoria int primary key auto_increment,
    descripcion varchar(100)
);

create table productos (
    id_producto int primary key auto_increment,
    nombre varchar(100),
    marca varchar(100),
    precio double,
    stock int,
    id_categoria int,
    foreign key(id_categoria) references categorias(id_categoria)
);

insert into categorias(descripcion) values 
('Televisores'), ('Computadoras'), ('Impresoras'), ('Cine en casa'), ('Radio');
insert into productos(nombre,marca,precio,stock,id_categoria) values
('Tv LCD 19 Plg','Modelo Sony PFL3403',2199.0,40,1),
('Tv LCD 22 Plg','Modelo Lg LN22A450',2399.0,30,1),
('Tv LCD 32 Plg','Modelo Samsung LC813H',2999.0,25,1),
('Tv LCD 26 Plg','Modelo Panasonic 26LG30R',2999.0,25,1),
('CPU LE125','Lg',2199.0,15,2),
('CPU A64X2','Compaq',2499.0,8,2),
('CPU E5200','Hp',2699.0,5,2),
('CPU SG330','Dell',3099.0,5,2),
('Impresora T23','Xerox',219.0,18,3),
('Impresora DJ-6940','Dell',349.0,20,3),
('Impresora T33','Hp',399.0,12,3),
('Impresora K5400','Epson',499.0,8,3),
('Home cinema SPH70','Lg',319.0,4,4),
('Home cinema AMX115','Sony',419.0,4,4),
('Home cinema HT E 860','Samsung',599.0,2,4),
('Home cinema DC-T990','Panasonic',759.0,5,4),
('Home cinema HT-1105U','Sony',829.0,14,4),
('Radio ICF-S10MK2/SCE','Panasonic',79.0,15,5),
('Radio ICF-18','Lg',99.0,15,5),
('Radio ICF-303/304 AM-FM','Sony',129.0,8,5);

select * from productos;
select * from categorias;