/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  25/04/2024 11:54:12                      */
/*==============================================================*/


/*==============================================================*/
/* Table : Acte                                                 */
/*==============================================================*/
create table Acte (
   num                  INT4                 not null,
   nom                  VARCHAR(254)         null,
   prenom               VARCHAR(254)         null,
   dateDeces            DATE                 null,
   sexe                 VARCHAR(254)         null,
   lieuNais             VARCHAR(254)         null,
   profession           VARCHAR(254)         null,
   situationMatrimonial VARCHAR(254)         null,
   domicile             VARCHAR(254)         null,
   nomPere              VARCHAR(254)         null,
   nomMere              VARCHAR(254)         null,
   declaration          INT2                 null,
   declarant            VARCHAR(254)         null,
   nomTemoin1           VARCHAR(254)         null,
   professionTemoin1    VARCHAR(254)         null,
   nomTemoin2           VARCHAR(254)         null,
   professionTemoin2    VARCHAR(254)         null,
   residenceTemoin1     VARCHAR(254)         null,
   residenceTemoin2     VARCHAR(254)         null,
   nomOfficier          VARCHAR(254)         null,
   assistantOfficier    VARCHAR(254)         null,
   dateActe             DATE                 null,
   constraint PK_ACTE primary key (num)
);

/*==============================================================*/
/* Index : ACTE_PK                                              */
/*==============================================================*/
create unique index ACTE_PK on Acte (
num
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client (
   idClient             INT4                 not null,
   nom                  VARCHAR(254)         null,
   email                VARCHAR(254)         null,
   password             VARCHAR(254)         null,
   constraint PK_CLIENT primary key (idClient)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index CLIENT_PK on Client (
idClient
);

/*==============================================================*/
/* Table : DemandeService                                       */
/*==============================================================*/
create table DemandeService (
   demandeService       INT4                 not null,
   constraint PK_DEMANDESERVICE primary key (demandeService)
);

/*==============================================================*/
/* Index : DEMANDESERVICE_PK                                    */
/*==============================================================*/
create unique index DEMANDESERVICE_PK on DemandeService (
demandeService
);

/*==============================================================*/
/* Table : association1                                         */
/*==============================================================*/
create table association1 (
   idClient             INT4                 not null,
   demandeService       INT4                 not null,
   constraint PK_ASSOCIATION1 primary key (idClient, demandeService)
);

/*==============================================================*/
/* Index : ASSOCIATION1_PK                                      */
/*==============================================================*/
create unique index ASSOCIATION1_PK on association1 (
idClient,
demandeService
);

/*==============================================================*/
/* Index : ASSOCIATION1_FK                                      */
/*==============================================================*/
create  index ASSOCIATION1_FK on association1 (
idClient
);

/*==============================================================*/
/* Index : ASSOCIATION1_FK2                                     */
/*==============================================================*/
create  index ASSOCIATION1_FK2 on association1 (
demandeService
);

/*==============================================================*/
/* Table : association2                                         */
/*==============================================================*/
create table association2 (
   idClient             INT4                 not null,
   num                  INT4                 not null,
   constraint PK_ASSOCIATION2 primary key (idClient, num)
);

/*==============================================================*/
/* Index : ASSOCIATION2_PK                                      */
/*==============================================================*/
create unique index ASSOCIATION2_PK on association2 (
idClient,
num
);

/*==============================================================*/
/* Index : ASSOCIATION2_FK                                      */
/*==============================================================*/
create  index ASSOCIATION2_FK on association2 (
idClient
);

/*==============================================================*/
/* Index : ASSOCIATION2_FK2                                     */
/*==============================================================*/
create  index ASSOCIATION2_FK2 on association2 (
num
);

alter table association1
   add constraint FK_ASSOCIAT_ASSOCIATI_CLIENT foreign key (idClient)
      references Client (idClient)
      on delete restrict on update restrict;

alter table association1
   add constraint FK_ASSOCIAT_ASSOCIATI_DEMANDES foreign key (demandeService)
      references DemandeService (demandeService)
      on delete restrict on update restrict;

alter table association2
   add constraint FK_ASSOCIAT_ASSOCIATI_ACTE foreign key (num)
      references Acte (num)
      on delete restrict on update restrict;

alter table association2
   add constraint FK_ASSOCIAT_ASSOCIATI_CLIENT foreign key (idClient)
      references Client (idClient)
      on delete restrict on update restrict;

