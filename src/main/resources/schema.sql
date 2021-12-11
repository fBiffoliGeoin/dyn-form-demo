create schema if not exists menu;

drop table if exists menu.menu_users;
drop table if exists menu.menu_tables;
drop table if exists menu.menu_categories;
drop table if exists menu.menu_types;
drop index if exists cust_fk1; 
drop table if exists menu.environments;
drop table if exists menu.custom_db;


CREATE TABLE if not exists menu.menu_types
(
  id serial NOT NULL,
  description varchar(255) NOT NULL,
  general_path varchar(50) NOT NULL,
  CONSTRAINT mntp_pk PRIMARY KEY (id)
);


CREATE TABLE if not exists menu.menu_categories
(
  id serial NOT NULL,
  type_id int NOT NULL,
  sequence int,
  visible_to_all boolean NOT NULL DEFAULT false,
  description varchar(255) NOT NULL,
  read_only boolean NOT NULL DEFAULT false,
  CONSTRAINT mnct_pk PRIMARY KEY (id),
  CONSTRAINT mnct_fk1 FOREIGN KEY (type_id)
      REFERENCES menu.menu_types (id)
);


CREATE TABLE if not exists menu.menu_tables
(
  id serial,
  category_id int NOT NULL,
  sequence int,
  schema varchar(50),
  name varchar(255),
  file_name varchar(50) NOT NULL,
  description varchar(255) NOT NULL,
  file text,
  CONSTRAINT mntb_pk PRIMARY KEY (id),
  CONSTRAINT mntb_fk1 FOREIGN KEY (category_id)
      REFERENCES menu.menu_categories (id)
 );


CREATE TABLE if not exists menu.menu_users
(
  id serial,
  category_id int NOT NULL,
  user_name text NOT NULL,
  CONSTRAINT mnmu_pk PRIMARY KEY (id),
  CONSTRAINT mnmu_fk1 FOREIGN KEY (category_id)
      REFERENCES menu.menu_categories (id)
);
 


create schema if not exists errors;


CREATE TABLE if not exists errors.errors
(
  id serial NOT NULL,
  text text,
  stacktrace text,
  CONSTRAINT err_pk PRIMARY KEY (id)
);

CREATE TABLE if not exists errors.errors_detail
(
  id serial NOT NULL,
  error_id int not null,
  client_ip varchar(255),
  dt_date timestamp not null,
  CONSTRAINT err_detail_pk PRIMARY KEY (id),
  CONSTRAINT err_detail_fk1 FOREIGN KEY (error_id)
      REFERENCES errors.errors (id)
);

CREATE TABLE if not exists menu.custom_db
(
  id serial NOT NULL,
  description varchar(255) NOT NULL,
  code varchar(20) NOT NULL,
  CONSTRAINT cust_pk PRIMARY KEY (id)
);

CREATE TABLE if not exists menu.environments
(
  id serial NOT NULL,
  cust_id int not null,
  description varchar(255) NOT NULL,
  code varchar(20) NOT NULL,
  schema varchar(50),
  CONSTRAINT env_pk PRIMARY KEY (id),
  CONSTRAINT env_fk1 FOREIGN KEY (cust_id)
      REFERENCES menu.custom_db(id)
);

--alter table menu.custom_db add default_env_id int;
--alter table menu.custom_db add CONSTRAINT cust_fk1 FOREIGN KEY (default_env_id) REFERENCES menu.environments(id);


create schema if not exists discography;

drop table if exists discography.artist_typologies;
drop table if exists discography.musical_genres;
drop table if exists discography.artists;
drop table if exists discography.albums;


CREATE TABLE if not exists discography.artist_typologies
(
  id serial NOT NULL,
  description varchar(255) NOT NULL,
  CONSTRAINT arty_pk PRIMARY KEY (id)
);

CREATE TABLE if not exists discography.musical_genres
(
  id serial NOT NULL,
  description varchar(255) NOT NULL,
  CONSTRAINT muge_pk PRIMARY KEY (id)
);

CREATE TABLE if not exists discography.artists
(
  id serial NOT NULL,
  typology_id int not null,
  name varchar(255) NOT NULL,
  CONSTRAINT arti_pk PRIMARY KEY (id),
  CONSTRAINT arti_fk1 FOREIGN KEY (typology_id)
      REFERENCES discography.artist_typologies (id)
);

CREATE TABLE if not exists discography.albums
(
  id serial NOT NULL,
  artist_id int not null,
  genre_id int not null,
  release_date date,
  release_year int,
  title varchar(255) NOT NULL,
  CONSTRAINT albu_pk PRIMARY KEY (id),
  CONSTRAINT albu_fk1 FOREIGN KEY (artist_id)
      REFERENCES discography.artists (id),
  CONSTRAINT albu_fk2 FOREIGN KEY (genre_id)
      REFERENCES discography.musical_genres (id)
);
