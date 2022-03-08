CREATE TABLE IF NOT EXISTS client (
    id_client int primary key generated always as identity,
    username varchar(30) not null unique,
    email varchar(40) not null unique,
    password character(64) not null unique,
    is_admin boolean not null default false
);

CREATE TABLE IF NOT EXISTS website (
    id_website int primary key generated always as identity,
    url character(64) not null unique
);

CREATE TABLE IF NOT EXISTS comment (
    id_comment int primary key generated always as identity,
    comment_value varchar(280) not null,
    posted timestamp with time zone not null default current_timestamp(0),
    nr_likes int not null default 0,
    is_nsfw boolean not null default false,
    fk_client int not null,
    fk_website int not null
);

CREATE TABLE IF NOT EXISTS client_comment (
    id_client_comment int primary key generated always as identity,
    fk_client int not null,
    fk_comment int not null
);

ALTER TABLE comment
ADD CONSTRAINT fkc_user_comment
FOREIGN KEY (fk_client)
REFERENCES client(id_client)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE comment
ADD CONSTRAINT fkc_website_comment
FOREIGN KEY (fk_website)
REFERENCES website(id_website)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE client_comment
ADD CONSTRAINT fkc_client_client_comment
FOREIGN KEY (fk_client)
REFERENCES client(id_client)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE client_comment
ADD CONSTRAINT fkc_comment_client_comment
FOREIGN KEY (fk_comment)
REFERENCES comment(id_comment)
ON UPDATE CASCADE ON DELETE RESTRICT;
