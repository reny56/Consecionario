USE [master]
GO
/****** Object:  Database [dbconcesionario]    Script Date: 14/4/2019 12:47:01 p. m. ******/
CREATE DATABASE [dbconcesionario] ON  PRIMARY 
( NAME = N'dbconcesionario', FILENAME = N'c:\Users\annyl\Documents\SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\dbconcesionario.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbconcesionario_log', FILENAME = N'c:\Users\annyl\Documents\SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\dbconcesionario_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbconcesionario] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbconcesionario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbconcesionario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbconcesionario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbconcesionario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbconcesionario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbconcesionario] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbconcesionario] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbconcesionario] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbconcesionario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbconcesionario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbconcesionario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbconcesionario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbconcesionario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbconcesionario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbconcesionario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbconcesionario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbconcesionario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbconcesionario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbconcesionario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbconcesionario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbconcesionario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbconcesionario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbconcesionario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbconcesionario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbconcesionario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbconcesionario] SET  MULTI_USER 
GO
ALTER DATABASE [dbconcesionario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbconcesionario] SET DB_CHAINING OFF 
GO
USE [dbconcesionario]
GO
/****** Object:  StoredProcedure [dbo].[ActualizaDatos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  ACTUALIZA DATOS
-- =============================================
CREATE PROCEDURE [dbo].[ActualizaDatos]
@Idcliente int,
@cedula varchar(20),
@nombre varchar(50),
@apellido varchar(50),
@telefono float,
@direccion varchar (50),
@correo varchar(50),
@fechaNa Date

AS
BEGIN

UPDATE    clientes
SET              cedula = @cedula, nombre = @nombre, apellido = @apellido, telefono = @telefono, direccion=@direccion,correo=@correo,fechaNa=@fechaNa
WHERE     (Idcliente =  @Idcliente)

END

GO
/****** Object:  StoredProcedure [dbo].[ActualizaDatosautos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  ACTUALIZA DATOS
-- =============================================
create PROCEDURE [dbo].[ActualizaDatosautos]
@Idauto int,
@chasis varchar (30),
@Marca varchar (30),
@modelo varchar (30),
@ano float (10),
@color varchar (30),
@tipo varchar (30),
@combustible varchar (30),
@trasmision varchar (30),
@puertas varchar (30),
@motor varchar (30),
@precio float (30)

AS
BEGIN

UPDATE    autos
SET              chasis=@chasis,Marca=@Marca,modelo=@modelo,ano=@ano,color=@color,tipo=@tipo,combustible=@combustible,trasmision=@trasmision,puertas=@puertas,motor=@motor,precio=@precio
WHERE     (Idauto =  @Idauto)

END

GO
/****** Object:  StoredProcedure [dbo].[ActualizaDatosvendedor]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  ACTUALIZA DATOS
-- =============================================
create PROCEDURE [dbo].[ActualizaDatosvendedor]
@Idvendedor int,
@cedula varchar(20),
@nombre varchar(50),
@apellido varchar(50),
@telefono float,
@direccion varchar (50),
@correo varchar(50),
@fechaNa Date,
@sucursal varchar (20)

AS
BEGIN

UPDATE    vendedor
SET              cedula = @cedula, nombre = @nombre, apellido = @apellido, telefono = @telefono, direccion=@direccion,correo=@correo,fechaNa=@fechaNa
WHERE     (Idvendedor =  @Idvendedor)

END

GO
/****** Object:  StoredProcedure [dbo].[ConsultaDatos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  CONSULTA DATOS
-- =============================================
CREATE PROCEDURE [dbo].[ConsultaDatos]

AS
BEGIN

SELECT    Idcliente, cedula,nombre, apellido, telefono, direccion, correo, fechaNa
FROM       clientes
ORDER BY Idcliente

END

GO
/****** Object:  StoredProcedure [dbo].[ConsultaDatosautos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  CONSULTA DATOS
-- =============================================
CREATE PROCEDURE [dbo].[ConsultaDatosautos]

AS
BEGIN

SELECT    Idauto,chasis,Marca,modelo,ano,color,tipo,combustible,trasmision,puertas,motor,precio
FROM       autos
ORDER BY Idauto

END


GO
/****** Object:  StoredProcedure [dbo].[ConsultaDatosvendedor]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  CONSULTA DATOS
-- =============================================
CREATE PROCEDURE [dbo].[ConsultaDatosvendedor]

AS
BEGIN

SELECT    Idvendedor, cedula, nombre, apellido, telefono, direccion, correo, fechaNa, sucursal
FROM       vendedor
ORDER BY Idvendedor

END


GO
/****** Object:  StoredProcedure [dbo].[ConsultaDatosventas]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  CONSULTA DATOS
-- =============================================
CREATE PROCEDURE [dbo].[ConsultaDatosventas]

AS
BEGIN

SELECT    Idvendedor, vnombre, vapellido,sucursal,Idcliente,cnombre,capellido,ccedula,Idauto ,chasis,Marca,modelo,ano,color,tipo,combustible,trasmision,puertas,motor,precio,descuento,pagounitario,tiempo,interes,cuotas
FROM       ventas
ORDER BY Idvendedor

END

GO
/****** Object:  StoredProcedure [dbo].[EliminaDatos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----
-- Description:  ELIMINADATOS DATOS
-- =============================================
create PROCEDURE [dbo].[EliminaDatos]

@Idcliente int

AS
BEGIN

DELETE FROM clientes WHERE Idcliente = @Idcliente

END

GO
/****** Object:  StoredProcedure [dbo].[EliminaDatosautos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[EliminaDatosautos]

@Idauto int

AS
BEGIN

DELETE FROM autos WHERE Idauto = @Idauto

END ---


GO
/****** Object:  StoredProcedure [dbo].[EliminaDatosvendedor]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----
-- Description:  ELIMINADATOS DATOS
-- =============================================
create PROCEDURE [dbo].[EliminaDatosvendedor]

@Idvendedor int

AS
BEGIN

DELETE FROM vendedor WHERE Idvendedor =  @Idvendedor

END ---


GO
/****** Object:  StoredProcedure [dbo].[InsertaDatos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  INSERTA DATOS
-- =============================================
create PROCEDURE [dbo].[InsertaDatos]

@cedula varchar(20),
@nombre varchar(50),
@apellido varchar(50),
@telefono float,
@direccion varchar (50),
@correo varchar(50),
@fechaNa Date

AS
BEGIN

INSERT INTO clientes
                      (cedula, nombre, apellido, telefono, direccion, correo, fechaNa)
VALUES     (@cedula,@nombre, @apellido, @telefono,@direccion,@correo,@fechaNa)


END

GO
/****** Object:  StoredProcedure [dbo].[InsertaDatosautos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  INSERTA DATOS
-- =============================================
create PROCEDURE [dbo].[InsertaDatosautos]
@chasis varchar (30),
@Marca varchar (30),
@modelo varchar (30),
@ano float (10),
@color varchar (30),
@tipo varchar (30),
@combustible varchar (30),
@trasmision varchar (30),
@puertas varchar (30),
@motor varchar (30),
@precio float (30)

AS
BEGIN

INSERT INTO autos
                      (chasis,Marca,modelo,ano,color,tipo,combustible,trasmision,puertas,motor,precio)
VALUES     (@chasis,@Marca,@modelo,@ano,@color,@tipo,@combustible,@trasmision,@puertas,@motor,@precio)


END

GO
/****** Object:  StoredProcedure [dbo].[InsertaDatosvendedor]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsertaDatosvendedor]

@cedula varchar(20),
@nombre varchar(50),
@apellido varchar(50),
@telefono float (50),
@direccion varchar (50),
@correo varchar(50),
@fechaNa Date,
@sucursal varchar (20)

AS
BEGIN

INSERT INTO vendedor
                      (cedula, nombre, apellido, telefono, direccion, correo, fechaNa, sucursal)
VALUES     (@cedula,@nombre, @apellido, @telefono,@direccion,@correo,@fechaNa, @sucursal)


END

GO
/****** Object:  StoredProcedure [dbo].[InsertaDatosventas]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:  INSERTA DATOS
-- =============================================
create PROCEDURE [dbo].[InsertaDatosventas]
@Idvendedor int,
@vnombre varchar (50),
@vapellido varchar (50),
@sucursal varchar (20),
@Idcliente int,
@cnombre varchar (50) ,
@capellido varchar (50) ,
@ccedula varchar(20),
@Idauto int ,
@chasis varchar (30),
@Marca varchar (30),
@modelo varchar (30),
@ano float (10),
@color varchar (30),
@tipo varchar (30),
@combustible varchar (30),
@trasmision varchar (30),
@puertas varchar (30),
@motor varchar (30),
@precio float (30),
@descuento float,
@pagounitario float,
@tiempo varchar,
@interes float,
@cuotas float
AS
BEGIN

INSERT INTO ventas
                      (Idvendedor, vnombre, vapellido,sucursal,Idcliente,cnombre,capellido,ccedula,Idauto ,chasis,Marca,modelo,ano,color,tipo,combustible,trasmision,puertas,motor,precio,descuento,pagounitario,tiempo,interes,cuotas)
VALUES     (@Idvendedor, @vnombre, @vapellido,@sucursal,@Idcliente,@cnombre,@capellido,@ccedula,@Idauto,@chasis,@Marca,@modelo,@ano,@color,@tipo,@combustible,@trasmision,@puertas,@motor,@precio, @descuento,@pagounitario,@tiempo,@interes,@cuotas)


END


GO
/****** Object:  Table [dbo].[autos]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[autos](
	[Idauto] [int] IDENTITY(1,1) NOT NULL,
	[chasis] [varchar](30) NULL,
	[Marca] [varchar](30) NULL,
	[modelo] [varchar](30) NULL,
	[ano] [real] NULL,
	[color] [varchar](30) NULL,
	[tipo] [varchar](30) NULL,
	[combustible] [varchar](30) NULL,
	[trasmision] [varchar](30) NULL,
	[puertas] [varchar](30) NULL,
	[motor] [varchar](30) NULL,
	[precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idauto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[Idcliente] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](20) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[telefono] [float] NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[correo] [varchar](20) NULL,
	[fechaNa] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Position] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idser] [int] IDENTITY(1,1) NOT NULL,
	[texto] [varchar](50) NULL,
	[numero] [float] NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vendedor]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vendedor](
	[Idvendedor] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](20) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[telefono] [float] NULL,
	[direccion] [varchar](100) NULL,
	[correo] [varchar](20) NULL,
	[fechaNa] [date] NULL,
	[sucursal] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Idvendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 14/4/2019 12:47:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ventas](
	[Idvendedor] [int] NULL,
	[vnombre] [varchar](50) NULL,
	[vapellido] [varchar](50) NULL,
	[sucursal] [varchar](20) NULL,
	[Idcliente] [int] NULL,
	[cnombre] [varchar](50) NULL,
	[capellido] [varchar](50) NULL,
	[ccedula] [varchar](20) NULL,
	[Idauto] [int] NULL,
	[chasis] [varchar](30) NULL,
	[Marca] [varchar](30) NULL,
	[modelo] [varchar](30) NULL,
	[ano] [real] NULL,
	[color] [varchar](30) NULL,
	[tipo] [varchar](30) NULL,
	[combustible] [varchar](30) NULL,
	[trasmision] [varchar](30) NULL,
	[puertas] [varchar](30) NULL,
	[motor] [varchar](30) NULL,
	[precio] [float] NULL,
	[descuento] [float] NULL,
	[pagounitario] [float] NULL,
	[tiempo] [varchar](1) NULL,
	[interes] [float] NULL,
	[cuotas] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_autos] FOREIGN KEY([Idauto])
REFERENCES [dbo].[autos] ([Idauto])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_autos]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_clientes] FOREIGN KEY([Idcliente])
REFERENCES [dbo].[clientes] ([Idcliente])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_clientes]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_vendedor] FOREIGN KEY([Idvendedor])
REFERENCES [dbo].[vendedor] ([Idvendedor])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_vendedor]
GO
USE [master]
GO
ALTER DATABASE [dbconcesionario] SET  READ_WRITE 
GO
