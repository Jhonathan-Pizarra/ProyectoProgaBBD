create database proyectoBDDP
use proyectoBDDP 

/*==============================================================*/
/* Table: CLIENTES				                                  */
/*==============================================================*/
create table CLIENTES
(
	codcli varchar(5) primary key NOT NULL,
	Nombrecliente varchar(30) NULL,
	Apellidoscliente varchar(30) NULL,
	sexo char(1) NOT NULL,
	CI varchar(8) NULL,
	telefono varchar(9) NULL,
	ruc varchar(11) NULL,
	e_mail varchar(50) NULL,
	direccion varchar(50) NULL,
)

/*==============================================================*/
/* Table: EMPLEADOS				                                  */
/*==============================================================*/
create table EMPLEADOS 
(
	codem varchar(5) primary key NOT NULL,
	apellidos varchar(30) NOT NULL,
	nombres varchar(30) NOT NULL,
	sexo char(1) NOT NULL,
	edad int NOT NULL,
	CI varchar(8) NOT NULL,
	telefono varchar(9) NOT NULL,
	email varchar (60) NULL,
)

/*==============================================================*/
/* Table: PRODUCTOS				                                  */
/*==============================================================*/
create table PRODUCTOS
(
	codpro varchar(5)  primary key NOT NULL,
	nombrepro varchar(40) NOT NULL,
	detalle varchar(40) NOT NULL,
	proveedor varchar(40) NOT NULL,
	precio varchar(10) NOT NULL,
	stock varchar(20) NULL,
 )
 
/*==============================================================*/
/* Table: FACTURA				                                  */
/*==============================================================*/
create table FACTURA
(
	numfactura varchar(10) primary key NOT NULL,
	fecha varchar(9) NULL,
	codcli varchar(5) NULL,
	ruc varchar(11) NOT NULL,
	subtotal varchar(15) NULL,
	descuento varchar(15) NULL,
	ivg varchar(15) NULL,
	total varchar(15) NULL,
 )
 
/*==============================================================*/
/* Table: DETALLE FACTURA	                                    */
/*==============================================================*/
 create table DETALLEF
(
	numfactura varchar(10) NULL,
	codpro varchar(5) NULL,
	producto varchar(40) NULL,
	cantidad varchar(15) NULL,
	precio_unit varchar(15) NULL,
	precio_vent varchar(15) NULL
)

/*==============================================================*/
/* Table: BOLETO DE COMPRA	                                    */
/*==============================================================*/
create table BOLETOS(
	n_boleto [varchar](10) primary key NOT NULL,
	fecha varchar(9) NULL,
	codcli varchar(5) NULL,
	preciototal varchar(15) NULL,
)

/*==============================================================*/
/* Table: DETALLE DE BOLETO		                            */
/*==============================================================*/
create table DETALLEB
(
	numboleto varchar(10) NULL,
	codpro varchar(5) NULL,
	producto varchar(40) NULL,
	cantidad varchar(15) NULL,
	precio_unit varchar(15) NULL,
	precio_vent varchar(15) NULL
)


/*==============================================================*/
/* Proceso: Agregar Cliente			                            */
/*==============================================================*/
GO
SET QUOTED_IDENTIFIER ON
GO
---procedimiento almacennado de clientes
create procedure agregarcliente
@codcli varchar(5),
@Nombrecliente varchar(30),
@Apellidoscliente varchar(30),
@sexo CHAR(1),
@CI varchar(8),
@telefono varchar(9),
@ruc varchar(11),
@e_mail varchar(50),
@direccion varchar(50)
as begin
insert into CLIENTES values(@codcli,@Nombrecliente,@Apellidoscliente,@sexo,@CI,@telefono,@ruc,@e_mail,@direccion)
end

/*==============================================================*/
/* Proceso: Buscar Cliente			                            */
/*==============================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure buscarcliente
@codcli varchar(5)
as begin
select * from CLIENTES  where codcli=@codcli
end

/*==============================================================*/
/* Proceso: Buscar Boletos			                            */
/*==============================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure buscarboletos
AS BEGIN 
SELECT * FROM BOLETOS
END

/*==============================================================*/
/* Proceso: Buscar BoletosxNumero		                        */
/*==============================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure buscarboletno /*buscar por numero de boleto*/
@n_boleto varchar(10)
AS BEGIN 
SELECT * FROM BOLETOS where n_boleto=@n_boleto
END

/*==============================================================*/
/* Proceso: Buscar BoletosxFecha		                        */
/*==============================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  BUSCARboletaFECHA
@fecha varchar(9)
AS BEGIN 
SELECT * FROM BOLETOS where fecha=@fecha
END

/*==============================================================*/
/* Foreing Key: Factura_codigoCliente	                        */
/*==============================================================*/
ALTER TABLE FACTURA  WITH CHECK ADD  CONSTRAINT [ FK__factura__codcli__6AEFE058] 
FOREIGN KEY([codcli])
REFERENCES CLIENTES ([codcli])

ALTER TABLE FACTURA CHECK CONSTRAINT [ FK__factura__codcli__6AEFE058]

/*==============================================================*/
/* Foreing Key: boletos_codigoCliente	                        */
/*==============================================================*/
ALTER TABLE BOLETOS  WITH CHECK ADD  CONSTRAINT [ FK__boletos__codcli__55009F39] 
FOREIGN KEY([codcli])
REFERENCES CLIENTES ([codcli])

ALTER TABLE BOLETOS CHECK CONSTRAINT [ FK__boletos__codcli__55009F39]

/*==============================================================*/
/* Foreing Key: detallef__codpro                                */
/*==============================================================*/
ALTER TABLE DETALLEF  WITH CHECK ADD  CONSTRAINT [ FK__detallef__codpro__6DCC4D03] 
FOREIGN KEY([codpro])
REFERENCES PRODUCTOS ([codpro])

ALTER TABLE DETALLEF CHECK CONSTRAINT [ FK__detallef__codpro__6DCC4D03]

/*==============================================================*/
/* Foreing Key: detallef__numeroFactura                         */
/*==============================================================*/
ALTER TABLE DETALLEF  WITH CHECK ADD  CONSTRAINT [ FK__detallef__n_fact__6CD828CA] 
FOREIGN KEY([numfactura])
REFERENCES FACTURA ([numfactura])

ALTER TABLE DETALLEF CHECK CONSTRAINT [ FK__detallef__n_fact__6CD828CA]

/*==============================================================*/
/* Foreing Key: detalleboleto__codpro                           */
/*==============================================================*/
ALTER TABLE DETALLEB  WITH CHECK ADD  CONSTRAINT [ FK__detalleb__codpro__58D1301D] 
FOREIGN KEY([codpro])
REFERENCES PRODUCTOS ([codpro])

ALTER TABLE DETALLEB CHECK CONSTRAINT [ FK__detalleb__codpro__58D1301D]

/*==============================================================*/
/* Foreing Key: detalleboleto__codp                             */
/*==============================================================*/
ALTER TABLE DETALLEB  WITH CHECK ADD  CONSTRAINT [ FK__detalleb__n_bole__57DD0BE4] 
FOREIGN KEY(numboleto)
REFERENCES BOLETOS (n_boleto)

ALTER TABLE DETALLEB CHECK CONSTRAINT [ FK__detalleb__n_bole__57DD0BE4]
