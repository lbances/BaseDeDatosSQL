create database MesaDeAyuda;

use MesaDeAyuda;

create table Cliente(
	idCliente int identity (1, 1),
	numdoc int primary key,
	nomCliente varchar(50) not null,
	apeCliente varchar(50) not null,
	Usuario varchar(50) not null,
	Clave varchar(50) not null,
	telCliente int not null,
	dirCliente varchar(100) not null,
	tipoDocCliente varchar(10) not null,
	Id_rol varchar(1)
)

insert into Cliente (numdoc, nomCliente, apeCliente, Usuario, Clave, telCliente, dirCliente, tipoDocCliente) values ('75514471', 'Leonardo', 'Bances', 'lbancese', '123456', '987654321', 'Av. Los Jasmines', 'DNI')

create table Solicitud(
	idSoli int identity (1, 1),
	nomCliente varchar(50) not null,
	apeCliente varchar(50) not null,
	tipoDocCli varchar(10) not null,
	numdoc int not null,
	dirCliente varchar(100) not null,
	telCliente int not null,
	detalle varchar(1000) not null,
	nomSoporte varchar(20) not null,
	numDocSo varchar(10) not null
)

create table Soporte(
	idSoporte int identity (1, 1),
	nomSoporte varchar(50) not null,
	apeSoporte varchar(50) not null,
	tipoDocSoporte varchar(10) not null,
	numDocSoporte int not null,
	telSoporte int not null,
	usuarioSo varchar(50) not null,
	claveSo varchar(50) not null,
)


create procedure SPRegistroCliente
@numdoc int,
@nomCliente varchar(50),
@apeCliente varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@telCliente int,
@dirCliente varchar(100),
@tipoDocCliente varchar(10),
@Id_rol varchar(1),
@Patron varchar(50)
as begin
insert into Cliente values (@numdoc, @nomCliente, @apeCliente, @Usuario, ENCRYPTBYPASSPHRASE(@Patron, @Clave), @telCliente, @dirCliente, @tipoDocCliente, @Id_rol)
end


create procedure SPRegistroSolicitud
@nomCliente varchar(50),
@apeCliente varchar(50),
@tipoDocCli varchar(10),
@numdoc int,
@dirCliente varchar(100),
@telCliente int,
@detalle varchar(1000),
@nomSoporte varchar(20),
@numDocSo varchar(10)
as begin
insert into Solicitud values (@nomCliente, @apeCliente, @tipoDocCli, @numdoc, @dirCliente, @telCliente, @detalle, @nomSoporte, @numDocSo)
end


select * from Cliente;
select * from Solicitud;
select * from Soporte;


create procedure IniciarSesion
@Usuario varchar(50),
@Clave varchar(max),
@Patron varchar(50)
as begin
select * from Cliente where Usuario = @Usuario and convert(varchar(50), DECRYPTBYPASSPHRASE(@Patron, Clave)) = @Clave
end


create procedure ListarCliente
as begin
select idCliente as 'ID Cliente', nomCliente as 'Nombre', apeCliente as 'Apellido', tipoDocCliente as 'Tipo de Documento', numDoc as 'Número de Documento' from Cliente
end

-- CRUD Cliente
create procedure C_RegistroCliente
@numdoc int,
@nomCliente varchar(50),
@apeCliente varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@telCliente int,
@dirCliente varchar(100),
@tipoDocCliente varchar(10),
@Id_rol varchar(1),
@Patron varchar(50)
as begin
insert into Cliente values (@numdoc, @nomCliente, @apeCliente, @Usuario, ENCRYPTBYPASSPHRASE(@Patron, @Clave), @telCliente, @dirCliente, @tipoDocCliente, @Id_rol)
end

create procedure R_BuscarCliente
@Id int
as begin
select * from Cliente where idCliente = @Id
end

create procedure U_ModificarCliente
@Id int,
@numdoc int,
@nomCliente varchar(50),
@apeCliente varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@telCliente int,
@dirCliente varchar(100),
@tipoDocCliente varchar(10),
@Id_rol varchar(1)
as begin
update Cliente set numdoc = @numdoc, nomCliente = @nomCliente, apeCliente = @apeCliente, Usuario = @Usuario, Clave = @Clave, telCliente = @telCliente, dirCliente = @dirCliente, tipoDocCliente = @tipoDocCliente, Id_rol = @Id_rol where idCliente = @Id
end

create procedure D_EliminarCliente
@Id int
as begin
delete from Cliente where idCliente = @Id
end


create procedure ListarSolicitudes
as begin
select idSoli as 'ID Solicitud', nomCliente as 'Nombre', apeCliente as 'Apellido', tipoDocCli as 'Tipo de Documento', numdoc as 'Número de Documento', detalle as 'Detalle' from Solicitud
end

-- CRUD Solicitud
create procedure C_RegistroSolicitud
@nomCliente varchar(50),
@apeCliente varchar(50),
@tipoDocCli varchar(10),
@numdoc int,
@dirCliente varchar(100),
@telCliente int,
@detalle varchar(1000),
@nomSoporte varchar(20),
@numDocSo varchar(10)
as begin
insert into Solicitud values (@nomCliente, @apeCliente, @tipoDocCli, @numdoc, @dirCliente, @telCliente, @detalle, @nomSoporte, @numDocSo)
end

create procedure R_BuscarSolicitud
@IdSolicitud int
as begin
select * from Solicitud where idSoli = @IdSolicitud
end

create procedure U_ModificarSolicitud
@IdSolicitud int,
@nomCliente varchar(50),
@apeCliente varchar(50),
@tipoDocCli varchar(10),
@numdoc int,
@dirCliente varchar(100),
@telCliente int,
@detalle varchar(1000),
@nomSoporte varchar(20),
@numDocSo varchar(10)
as begin
update Solicitud set nomCliente = @nomCliente, apeCliente = @apeCliente, tipoDocCli = @tipoDocCli, numdoc = @numdoc, dirCliente = @dirCliente, telCliente = @telCliente, detalle = @detalle, nomSoporte = @nomSoporte, numDocSo = @numDocSo where idSoli = @IdSolicitud
end

create procedure D_EliminarSolicitud
@IdSolicitud int
as begin
delete from Solicitud where idSoli = @IdSolicitud
end