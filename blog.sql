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
--  fk oriunda da tabela usuario (id serial primary key)
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

INSERT INTO artigo (titulo, texto, usuario_id, categoria_id) values
('atitulo', 'atexto', 1, 1);

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

-- Exercícios de Consulta (SELECT)

--1)
SELECT nome, data_nascimento FROM usuario ORDER BY nome ASC, data_nascimento DESC;

-- OFF:TOPIC: 
SELECT * FROM usuario WHERE data_nascimento IS NOT NULL;

-- 2)
select * from artigo ORDER BY titulo;

--3) 
SELECT * FROM usuario WHERE bairro IS NOT NULL;

-- 4) 
SELECT * FROM artigo WHERE cast(data_hora as date) >= CURRENT_DATE - interval '7 days' AND cast(data_hora as date) <= CURRENT_dATE;

-- 4) com between
SELECT * FROM artigo WHERE cast(data_hora as date) between CURRENT_DATE - interval '7 days' AND CURRENT_dATE order by titulo;

-- 5) 
-- off-topic: SELECt titulo, data_hora, extract(month from cast(data_hora as date)) as mes_publicacao from artigo;

-- 6)
SELECT * FROM usuario WHERE nome ILIKE 'i%';

--OFF:TOPIC: SELECT * FROM usuario WHERE nome LIKE 'I___';

-- 7)
 select * from telefone where usuario_id = 1;

-- 8) 
SELECT * FROM artigo where texto ILIKE '%TEXTO%';

-- 10)
SELECT * FROM usuario where cep = '12345678';

--Exercícios de Atualização (UPDATE)
--1) 
UPDATE usuario SET nome = 'Igor Pereira' where id =1 ;
UPDATE usuario SET bairro  = 'centro' where id =1 ;

-- 2)
update usuario set senha = md5('nova_senha') where email = 'igor.pereira@riogrande.ifrs.edu.br';


-- Exercícios de Deleção (DELETE)
--1) Delete o usuário com ID 1.
BEGIN;
    DELETE FROM artigo where usuario_id = 1;
    DELETE FROM curtida where usuario_id = 1;
    DELETE FROM comentario WHERE usuario_id = 1;
    DELETE FROM usuario where id = 1;
COMMIT;
--2)
DELETE FROM artigo WHERE extract(year from cast(data_hora as date)) < 2024;


--Delete todos os comentários associados ao artigo com ID 1.
-- jump
--Delete todas as curtidas associadas ao usuário com ID 1.
-- jump
--Delete todos os telefones associados ao usuário com ID 1.
-- jump

-- Exercícios de DDL (Data Definition Language)
-- 1) Adicione uma coluna apelido na tabela usuario.
ALTER TABLE usuario ADD COLUMN apelido text;

-- 2)
ALTER TABLE usuario DROP COLUMN bairro;

-- 3) jump

-- 4) jump


-- 5) ALTER TABLE telefone  RENAME TO telefones;


