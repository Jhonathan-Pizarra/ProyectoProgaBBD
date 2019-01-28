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