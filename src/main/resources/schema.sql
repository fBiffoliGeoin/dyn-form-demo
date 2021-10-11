create schema if not exists menu;

drop table if exists menu.menu_users;
drop table if exists menu.menu_tables;
drop table if exists menu.menu_categories;
drop table if exists menu.menu_types;
drop table if exists menu.environments;


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
  dt_date date not null,
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
  CONSTRAINT env_pk PRIMARY KEY (id),
  CONSTRAINT env_fk1 FOREIGN KEY (cust_id)
      REFERENCES menu.custom_db(id)
);

alter table menu.custom_db add default_env_id int;
alter table menu.custom_db add CONSTRAINT cust_fk1 FOREIGN KEY (default_env_id) REFERENCES menu.environments(id);
