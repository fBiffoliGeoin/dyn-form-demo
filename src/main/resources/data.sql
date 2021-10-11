insert into menu.menu_types (description, general_path) values ('General', 'menu');

insert into menu.menu_categories (type_id, sequence, visible_to_all, description, read_only) values (1, 10, true, 'Menu Configuration', false);
insert into menu.menu_categories (type_id, sequence, visible_to_all, description, read_only) values (1, 999, true, 'Errors', false);

insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(1, 10, 'menu_types.json', 'Typologies', 'menu', 'menu_types');
insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(1, 20, 'menu_categories.json', 'Sub menu', 'menu', 'menu_categories');
insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(1, 30, 'menu_tables.json', 'Tables', 'menu', 'menu_tables');
insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(1, 40, 'custom_db.json', 'Custom DBs', 'menu', 'custom_db');
insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(1, 50, 'environments.json', 'Environments', 'menu', 'environments');

insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(2, 10, 'errors_RO.json', 'Errors', 'errors', 'errors');



insert into menu.menu_types (description, general_path) values ('Discography', 'discography');

insert into menu.menu_categories (type_id, sequence, visible_to_all, description, read_only) values (2, 10, true, 'General', false);

insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(3, 10, 'musical_genres.json', 'Musical genres', 'discography', 'musical_genres');
insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(3, 20, 'artist_typologies.json', 'Artist typologies', 'discography', 'artist_typologies');
insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(3, 30, 'artists.json', 'Artists', 'discography', 'artists');
insert into menu.menu_tables (category_id, sequence, file_name, description, schema, name) values(3, 40, 'albums.json', 'Albums', 'discography', 'albums');


insert into menu.custom_db (description, code) values ('Discography', 'discography');
insert into menu.environments (cust_id, description, code) values (1, 'Local H2', 'h2');
