DROP DATABASE IF EXISTS `dbRestaurant`;
CREATE DATABASE `dbRestaurant`;
use dbRestaurant;

DROP TABLE IF EXISTS RESTAURANTS;
DROP TABLE IF EXISTS REVIEWS;
DROP TABLE IF EXISTS MEALSXRESTAURANT;
DROP TABLE IF EXISTS MEALSXORDER;
DROP TABLE IF EXISTS MEALS;
DROP TABLE IF EXISTS ORDERS;
 
/*==============================================================*/
/* Table: RESTAURANTS                                               */
/*==============================================================*/

create table RESTAURANTS
(
   IDRESTAURANT            	integer AUTO_INCREMENT not null,
   LOGO                 	varchar(200) not null,
   COMMERCIALNAME           varchar(200) not null,
   LEGALNAME                varchar(200) UNIQUE not null,
   RATING             		float  not null,
   COMMERCIALEMAIL          varchar(200) not null,
   ADMINNUMBER             	integer not null,
   ADRESS                 	varchar(200) not null,
   primary key (IDRESTAURANT)
);

/*==============================================================*/
/* Table: REVIEWS
/*==============================================================*/

create table REVIEWS
(
   IDREVIEW            	integer AUTO_INCREMENT not null,
   IDRESTAURANT         integer not null,
   NAMEREVIEW			varchar(200) not null,
   REVIEW				varchar(200) default"empty",
   RATING				integer not null,
   primary key (IDREVIEW)
);

/*==============================================================*/
/* Table: MEALS                            					    */
/*==============================================================*/

create table MEALS
(
   IDMEAL            	integer AUTO_INCREMENT not null,
   NAMEMEAL			    varchar(200) UNIQUE not null,
   DESCRIPTION			varchar(200) not null,
   PRICE				float not null,
   primary key (IDMEAL)
);

/*==============================================================*/
/* Table: MEALSXRESTAURANT                            			*/
/*==============================================================*/

create table MEALSXRESTAURANT
 (
   IDMXR                integer AUTO_INCREMENT not null,
   IDMEAL            	integer not null,
   IDRESTAURANT       	integer not null,
   primary key (IDMXR)
 );
 
/*==============================================================*/
/* Table: ORDERS		                            			*/
/*==============================================================*/
 
 create table ORDERS
 (
	IDORDER				integer AUTO_INCREMENT not null,
    TOTALCOST			float not null,
    ADRESS				varchar(200) not null,
    latLong				varchar(200)not null,
    ETA					float,
    primary key(IDORDER)
 );
 
/*==============================================================*/
/* Table: MEALSXORDER	                            			*/
/*==============================================================*/

create table MEALSXORDER
 (
   IDMXO                integer AUTO_INCREMENT not null,
   IDMEAL            	integer not null,
   IDORDER		       	integer not null,
   primary key (IDMXO)
 );
 
 
alter table REVIEWS add constraint FK_REVIEW_RESTAURANT foreign key (IDRESTAURANT)
references RESTAURANTS (IDRESTAURANT);

alter table MEALSXRESTAURANT add constraint FK_MXR_MEAL foreign key (IDMEAL)
references MEALS (IDMEAL);

alter table MEALSXRESTAURANT add constraint FK_MXR_RESTAURANT foreign key (IDRESTAURANT)
references RESTAURANTS (IDRESTAURANT);

alter table MEALSXORDER add constraint FK_MXO_MEAL foreign key (IDMEAL)
references MEALS (IDMEAL);

alter table MEALSXORDER add constraint FK_MXO_ORDER foreign key (IDORDER)
references ORDERS (IDORDER);


