/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     23/01/2019 10:45:52                          */
/*==============================================================*/
create database ProyectoPBDD
use ProyectoPBDD

/*==============================================================*/
/* Table: CATEGORIAS_PRODUCTOS                                  */
/*==============================================================*/
create table CATEGORIAS_PRODUCTOS (
   IDCATEGPROD          numeric(3)    primary key        not null,
   NOMBCATEG            varchar(30)          not null,
   DESCRIPCATEG         text                 not null,
)

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   IDCLIENT             numeric(9)    primary key        not null,
   NOMBCLIENT           varchar(30)          not null,
   APELLCLIENT          varchar(30)          not null,
   DIRECCLIENT          text                 not null,
   FECHANACCLIENT       datetime             not null,
   TELEFCLIENT          numeric(9)           not null,
   EMAILCLIENT          varchar(30)          not null,
)

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   NUMDETALLE           numeric(5)    primary key        not null,
   NUMFACT              numeric(5)           not null,
   CODPROD              numeric(5)           not null,
   PRECPROD             float(2)             not null,
   CANTPROD             int                  not null,
   PRECSUBTOTAL         float(2)             not null,
   IMPUESTPROD          float(2)             not null,
   DESCTOPROD           float(2)             not null,
   PRECITOTPROD         float(2)             not null,
)

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   NUMFACT              numeric(5)    primary key        not null,
   IDCLIENT             numeric(9)           not null,
   FECHAEMISFACT        datetime             not null,
)

/*==============================================================*/
/* Table: FORMAS_PAGO                                           */
/*==============================================================*/
create table FORMAS_PAGO (
   IDFORMPAG            numeric(3)    primary key        not null,
   NUMDETALLE           numeric(5)           not null,
   TIPOFORMPAG          varchar(30)          not null,
   DESCRIPFORMPAG       text                 not null,
)

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   CODPROD              numeric(5)    primary key        not null,
   IDCATEGPROD          numeric(3)           not null,
   NOMBPROD             varchar(30)          not null,
   PRECIOPROD           float(2)             not null,
   EXISTENPROD          int                  not null,
)

/*==============================================================*/
/* Table: VALIDACION_USUARIO                                    */
/*==============================================================*/
create table VALIDACION_USUARIO (
   NUMUSR               numeric(9)   primary key         not null,
   CONTRUSR             int                  not null,
   TIPOUSR              varchar(30)          not null,
)

/*==============================================================*/
/* FOREGING KEYS:                                               */
/*==============================================================*/
alter table DETALLE_FACTURA
   add constraint FK_DETALLE__DEBEN_PRODUCTO foreign key (CODPROD) /*Detalle debe tener un producto*/
      references PRODUCTOS (CODPROD) 
      
alter table DETALLE_FACTURA
   add constraint FK_DETALLE__TIENE_FACTURA foreign key (NUMFACT)  /*Una factura debe tener un detalle y viceversa*/
      references FACTURA (NUMFACT)    
      
alter table FACTURA
   add constraint FK_FACTURA_PUEDE_CLIENTES foreign key (IDCLIENT) /*Una factura tiene un cliente*/
      references CLIENTES (IDCLIENT)
      
alter table FORMAS_PAGO
   add constraint FK_FORMAS_P_DEBE_DETALLE_ foreign key (NUMDETALLE)/*Un detalle tiene una forma de pago*/
      references DETALLE_FACTURA (NUMDETALLE)
      
alter table PRODUCTOS
   add constraint FK_PRODUCTO_PUEDEN_CATEGORI foreign key (IDCATEGPROD) /*Un porducto tiene una categoria*/
      references CATEGORIAS_PRODUCTOS (IDCATEGPROD)


/*==============================================================*/
/* INGRESO DE DATOS: CATEGORÍAS                                 */
/*==============================================================*/
insert into CATEGORIAS_PRODUCTOS values
(001, 'Entrada','Sin descripcion')

insert into CATEGORIAS_PRODUCTOS values
(002, 'Plato fuerte','Sin descripcion')

insert into CATEGORIAS_PRODUCTOS values
(003, 'Bebidas','Sin descripcion')

insert into CATEGORIAS_PRODUCTOS values
(004, 'MiniDon','Sin descripcion')

insert into CATEGORIAS_PRODUCTOS values
(005, 'Postres','Sin descripcion')

select * from CATEGORIAS_PRODUCTOS

/*==============================================================*/
/* INGRESO DE DATOS: CLIENTES                                */
/*==============================================================*/
insert into CLIENTES values
(172535852, 'Jhonathan','Pizarra','Solanda sector 4',19/11/1996, 099080312, 'jhonathanxabier@gmail.com')

insert into CLIENTES values
(172535853, 'Xavier','Pachacama','Quimiag sector 2',18/10/1997, 099080313, 'XavierPachacama@gmail.com')

insert into CLIENTES values
(172535854, 'Emilia','Lopez','Mitad del Mundo',02/04/1995, 099080314, 'EmiliaLopez21@gmail.com')

insert into CLIENTES values
(172535855, 'Mercedes','Hinojosa','Av. Simón Bolivar',13/07/1999, 099080315, 'MercedesHinojosa@hotmail.com')

insert into CLIENTES values
(172535856, 'Dario','Cruz','Av. 25 de Julio',01/01/2001, 099080316, 'DarioCruz27@gmail.com')

insert into CLIENTES values
(172535857, 'Isabel','Chiriboga','Valle de los Chillos',14/07/1995, 099080317, 'IsabelChiriboga45@hotmail.com')

insert into CLIENTES values
(172535858, 'Juan','Valdez','Av. 12 de Octubre',18/12/2002, 099080319, 'JuanValdez@gmail.com')

insert into CLIENTES values
(172535859, 'Esteban','Ordoñez','Vicentina sector 2',05/05/2012, 099080320, 'EstebanOrdoñez12@hotmail.com')

insert into CLIENTES values
(172535820, 'Diego','Pilamunga','Valle de los Chillos',22/10/1994, 099080321, 'DiegoPilamunga@homail.com')

select * from CLIENTES

/*==============================================================*/
/* INGRESO DE DATOS: PRODUCTOS					                */
/*==============================================================*/
insert into PRODUCTOS values
(12345,001, 'Okonomiyaki',6.4,22)

insert into PRODUCTOS values
(12346,001, 'Kaisendon',7.2,19)

insert into PRODUCTOS values
(12347,001, 'Ensalada de la casa',4.2,17)

insert into PRODUCTOS values
(12348,002, 'Rollo de Pegasus',5.5,22)

insert into PRODUCTOS values
(12349,002, 'Salmón',3.1,22)

insert into PRODUCTOS values
(12350,002, 'Hanakura miso ramen',7.5,45)

insert into PRODUCTOS values
(12351,002, 'Tekka maki',5.3,15)

insert into PRODUCTOS values
(12352,003, 'Sake',6.4,10)

insert into PRODUCTOS values
(12353,003, 'Cerveza Kirin',2.9,16)

insert into PRODUCTOS values
(12354,003, 'Umeshu',4.9,21)

insert into PRODUCTOS values
(12355,004, 'Negitoro don',7.5,25)

insert into PRODUCTOS values
(12356,004, 'Kaisendon',7.5,26)

insert into PRODUCTOS values
(12357,004, 'Yasai don',5.3,29)

insert into PRODUCTOS values
(12234,005, 'Vieira',6.6,21)

insert into PRODUCTOS values
(12235,005, 'Dorayaki',3.1,23)

insert into PRODUCTOS values
(12245,005, 'Bolas de Arroz',4.2,25)

insert into PRODUCTOS values
(12123,005, 'Yakisoba ',2.1,34)

select * from PRODUCTOS

/*==============================================================*/
/* INGRESO DE DATOS: FACTURA	                                */
/*==============================================================*/
insert into FACTURA values
(54321,172535852, 19/11/2004)

insert into FACTURA values
(54322,172535852, 09/02/2003)

insert into FACTURA values
(54323,172535853, 12/03/1995)

insert into FACTURA values
(54324,172535854, 18/04/1994)

insert into FACTURA values
(54325,172535855, 22/05/2006)

insert into FACTURA values
(54326,172535852, 29/06/2008)

insert into FACTURA values
(54327,172535856, 03/08/2009)

insert into FACTURA values
(54328,172535857, 14/07/2014)

insert into FACTURA values
(54329,172535858, 11/04/2018)

insert into FACTURA values
(54330,172535853, 27/01/2019)

select * from FACTURA

/*==============================================================*/
/* INGRESO DE DATOS: DETALLE_FACTURA	                        */
/*==============================================================*/
insert into DETALLE_FACTURA values
(12131,54321, 12345, 6.4,22, 6.4,0.12,0.10,(6.4+(6.4*0.12)-(6.4*0.10)))

insert into DETALLE_FACTURA values
(14151,54322, 12348, 5.5,22, 5.5,0.12,0.20,(5.5+(5.5*0.12)-(5.5*0.20)))

insert into DETALLE_FACTURA values
(16171,54323, 12349, 3.1,22, 3.1,0.12,0.20,(3.1+(3.1*0.12)-(3.1*0.20)))

insert into DETALLE_FACTURA values
(18192,54324, 12354, 4.9,21, 4.9,0.12,0.10,(4.9+(4.9*0.12)-(4.9*0.10)))

insert into DETALLE_FACTURA values
(21222,54325, 12357, 5.3,29, 5.3,0.12,0.20,(5.3+(5.3*0.12)-(5.3*0.20)))

insert into DETALLE_FACTURA values
(23242,54322, 12355, 7.5,25, 7.5,0.14,0.10,(7.5+(7.5*0.14)-(7.5*0.10))) 

insert into DETALLE_FACTURA values
(25262,54323, 12346, 7.2,19, 7.2,0.12,0.10,(7.2+(7.2*0.12)-(7.2*0.10)))

insert into DETALLE_FACTURA values
(27282,54326, 12350, 7.5,45, 7.5,0.12,0.10,(7.5+(7.5*0.12)-(7.5*0.10)))

insert into DETALLE_FACTURA values
(29303,54327, 12355, 7.5,25, 7.5,0.14,0.50,(7.5+(7.5*0.14)-(7.5*0.50)))

insert into DETALLE_FACTURA values
(30313,54328, 12352, 6.4,10, 6.4,0.12,0.10,(6.4+(6.4*0.12)-(6.4*0.10)))

select * from DETALLE_FACTURA

/*==============================================================*/
/* INGRESO DE DATOS: FORMAS_PAGO		                        */
/*==============================================================*/
insert into FORMAS_PAGO values
(322,29303, 'Efectivo','Sin descipcion')

insert into FORMAS_PAGO values
(321,27282, 'Tarjeta Debito','Sin descipcion')

insert into FORMAS_PAGO values
(320,23242, 'Mobile Top up','Sin descipcion')

select * from FORMAS_PAGO