DROP DATABASE IF EXISTS blog;

CREATE DATABASE blog;

\c blog;

CREATE TABLE usuario (
    id serial PRIMARY KEY,
    nome character varying(150) not null,
    email character varying(150) unique,
    senha text not null,
    bairro text,
    rua text,
    nro text,
    cep character(8),
    data_registro date default current_date,
    data_nascimento date
);
INSERT INTO usuario (nome, email, senha) VALUES 
('IGOR', 'igor.pereira@riogrande.ifrs.edu.br', md5('123'));


CREATE TABLE telefone (
    id serial primary key,
    nro character varying(15) not null,
    usuario_id integer references usuario (id)
);

CREATE TABLE categoria (
    id serial primary key,
    nome text not null
);
INSERT INTO categoria (nome) values ('ação');

CREATE TABLE artigo (
    id serial primary key,
    titulo character varying(150) not null,
    texto text not null,
    data_hora timestamp default current_timestamp,
    usuario_id integer references usuario (id),
    categoria_id integer references categoria (id)
);
INSERT INTO artigo (titulo, texto, usuario_id, categoria_id) values
('titulo', 'texto', 1, 1);

CREATE TABLE curtida (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    artigo_id integer,
    usuario_id integer,
    FOREIGN KEY (artigo_id) references artigo (id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) references usuario (id)
);
INSERT INTO curtida (artigo_id, usuario_id) VALUES
(1, 1);



CREATE TABLE comentario (
    id serial primary key,
    conteudo text not null,
    data_hora timestamp default current_timestamp,
    artigo_id integer,
    usuario_id integer,
    FOREIGN KEY (artigo_id) references artigo (id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) references usuario (id)
);





