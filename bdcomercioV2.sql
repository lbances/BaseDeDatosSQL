create database bdcomercio;

use bdcomercio;

CREATE TABLE IF NOT EXISTS `categoria` (
  `codcat` int(11) NOT NULL AUTO_INCREMENT,
  `descat` varchar(30) NOT NULL,
  PRIMARY KEY (`codcat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5;

INSERT INTO `categoria` (`codcat`, `descat`) VALUES
(1, 'MONITOR'),
(2, 'DISCO DURO'),
(3, 'MEMORIA'),
(4, 'IMPRESORA');

create table usuario(
	idus int primary key auto_increment,
    nicus varchar(10) not null,
    pasus varchar(10) not null,
    nivus char(1) not null
);

insert into usuario(idus, nicus, pasus, nivus)
values(1, 'user01', '132456', 'U'),
	  (2, 'user02', '132456', 'U'),
      (3, 'user03', '132456', 'A');
      
select * from usuario;

CREATE TABLE IF NOT EXISTS `producto` (
  `codpro` int(11) NOT NULL AUTO_INCREMENT,
  `codcat` int(11) NOT NULL,
  `despro` varchar(60) NOT NULL,
  `unipro` varchar(30) NOT NULL,
  `pcopro` decimal(10,2) NOT NULL,
  `pvepro` decimal(10,2) NOT NULL,
  `stopro` decimal(10,2) NOT NULL,
  `frepro` date NOT NULL,
  PRIMARY KEY (`codpro`),
  KEY `FKCODCAT` (`codcat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

INSERT INTO `producto` (`codpro`, `codcat`, `despro`, `unipro`, `pcopro`, `pvepro`, `stopro`, `frepro`) VALUES
(1, 1, 'MONITOR SAMSUNG 14 Pulg', 'UND', '400.00', '500.00', '10.00', '2023-03-30'),
(2, 1, 'MONITOR HP 24 PULG.', 'UND', '600.00', '700.00', '8.00', '2023-03-30'),
(3, 4, 'IMPRESORA CANON MP 280', 'UND', '100.00', '150.00', '12.00', '2023-04-01'),
(4, 4, 'IMPRESORA FX 1170 PLANILLERA', 'UND', '120.00', '150.00', '10.00', '2023-04-01'),
(5, 2, 'DISCO DURO INTERNO 1TB SEAGATE SATA SOLIDO', 'UND', '180.00', '250.00', '15.00', '2023-04-20');

select * from producto;
select * from categoria;

CREATE TABLE IF NOT EXISTS `trabajador` (
  `codtra` int(11) NOT NULL AUTO_INCREMENT,
  `apetra` varchar(25) NOT NULL,
  `nomtra` varchar(25) NOT NULL,
  `dirtra` varchar(60) NOT NULL,
  `doctra` char(8) NOT NULL,
  `esttra` char(1) NOT NULL,
  `cortra` varchar(30) DEFAULT NULL,
  `teltra` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codtra`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

INSERT INTO `trabajador` (`codtra`, `apetra`, `nomtra`, `dirtra`, `doctra`, `esttra`, `cortra`, `teltra`) VALUES
(1, 'CASARIEGO CASTILLO', 'CARLOS', 'LIMA NORTE', '45676453', 'S', 'luis_l2023@gmail.com', '94546735');

ALTER TABLE `producto`
  ADD CONSTRAINT `FKCODCAT` FOREIGN KEY (`codcat`) REFERENCES `categoria` (`codcat`);
  
SELECT VERSION();