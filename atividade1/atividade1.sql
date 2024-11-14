DROP DATABASE IF EXISTS atividade1;

CREATE DATABASE atividade1;

\c atividade1;

CREATE TABLE missao (
    codigo serial primary key,
    descricao text not null,
    data_inicio date default current_date,
    data_fim date
);
INSERT INTO missao (descricao) VALUES 
('MISSÃO THANOS'),
('MISSÃO ULTRON'),
('MISSÃO ULTIMATO');

CREATE TABLE equipe (
    codigo serial primary key,
    nome character varying(200) not null
);
INSERT INTO equipe (nome) VALUES 
('VINGADORES'), 
('LIGA DA JUSTIÇA');

CREATE TABLE superheroi (
    codigo serial primary key,
    nome character varying(200) not null,
    bairro text,
    rua text,
    complemento text,
    nro text,
    equipe_codigo integer references equipe (codigo),
    mentor_codigo integer references superheroi (codigo)
);
INSERT INTO superheroi (nome, equipe_codigo) VALUES
('HOMEM DE FERRO', 1),
('HULK', 1),
('GAVIÃO ARQUEIRO', 1),
('SUPERMAN', 2),
('BATMAN', 2);

CREATE TABLE participacao (
    missao_codigo integer references missao (codigo),
    superheroi_codigo integer references superheroi (codigo),
    data_inicio date default current_date,
    data_fim date,
    primary key (missao_codigo, superheroi_codigo)
);
INSERT INTO participacao (superheroi_codigo, missao_codigo, data_inicio, data_fim) values
(1, 3, '2014-01-01', '2020-10-19');

CREATE TABLE poder (
    codigo serial primary key,
    nome text not null
);
INSERT INTO poder (nome) VALUES
('SER RICO'),
('SUPERFORÇA'),
('SUPER TEIA'),
('OLHOS LASERS');

CREATE TABLE superheroi_poder (
    superheroi_codigo integer references superheroi (codigo),
    poder_codigo integer references poder (codigo),
    primary key (superheroi_codigo, poder_codigo)
);
INSERT INTO superheroi_poder (superheroi_codigo, poder_codigo) VALUES
(5, 1),
(4, 4),
(4, 2),
(2, 2);

