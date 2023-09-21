create database FabricasEF;

use FabricasEF;

create table fabrica(
	codfab int primary key auto_increment,
    nomfab varchar(15)
);

insert into fabrica(codfab, nomfab)
values(1, 'Lima'),
	  (2, 'Piura'),
      (3, 'Chiclayo');
      
select * from fabrica;

create table usuario(
	codusu int primary key auto_increment,
    nomusu varchar(20) not null,
    clausu varchar(20) not null,
    codfab int not null,
    foreign key(codfab) references fabrica(codfab)
);

ALTER TABLE usuario MODIFY COLUMN clausu VARCHAR(128);

insert into usuario(codusu, nomusu, clausu, codfab)
values(1, 'Arana', '123456', 1),
	  (2, 'Bances', '123456', 2),
      (3, 'Romero', '123456', 3),
      (4, 'Velasquez', '123456', 1);
      
select * from usuario;

delete from usuario where codusu = 12;
select * from usuario where codusu = 5;

create table piezas(
	codpie int primary key auto_increment,
    fecpie date not null,
    linpie char(1) not null,
    codfab int not null,
    codusu int not null,
    canpie int not null,
    foreign key(codfab) references fabrica(codfab),
    foreign key(codusu) references usuario(codusu)    
);

insert into piezas(codpie, fecpie, linpie, codfab, codusu, canpie)
values(1, '2023-08-20', 'A', 1, 1, 20),
	  (2, '2023-08-19', 'B', 2, 2, 30),
      (3, '2023-08-18', 'C', 3, 3, 40),
      (4, '2023-08-17', 'A', 1, 4, 50);
      
select * from piezas;

select * from piezas
where fecpie >= '2023-08-01' and fecpie <= '2024-08-31';

SELECT
    p.codpie,
    p.fecpie,
    p.linpie,
    f.nomfab,
    u.nomusu,
    p.canpie
FROM
    piezas p
JOIN
    fabrica f ON p.codfab = f.codfab
JOIN
    usuario u ON p.codusu = u.codusu
WHERE
    p.fecpie BETWEEN '2023-08-01' AND '2023-08-31';
    
    SELECT
    u.codusu,
    u.nomusu,
    u.clausu,
    u.codfab
FROM
    usuario u;