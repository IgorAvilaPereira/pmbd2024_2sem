CREATE DATABASE publicacao;

\c publicacao;

CREATE TABLE artigo (
    id serial primary key,
    titulo text not null,
    resumo text not null,
    nome_arquivo character varying(100) not null
);

CREATE TABLE palavra_chave (
    id serial primary key,
    descricao text not null
);

CREATE TABLE artigo_palavrachave (
    artigo_id integer references artigo (id),
    palavrachave_id integer references palavra_chave (id),
    primary key (artigo_id, palavrachave_id)
);

CREATE TABLE instituicao (
    id serial primary key,
    nome character varying(150) not null,
    email character varying(150) not null,
    bairro text,
    rua text,
    cep character(8),
    complemento text,
    nro character varying(20)
);
INSERT INTO instituicao (nome, email) VALUES 
('IFRS', 'ifrs@ifrs.gov.br');


CREATE TABLE autor (
    id serial primary key,
    nome character varying(100) not null,
    data_nascimento date,
    instituicao_id integer references instituicao (id)    
);
INSERT INTO autor (nome, data_nascimento, instituicao_id) VALUES
('IGOR AVILA PEREIRA', '1987-01-20', 1);


CREATE TABLE emails (
    id serial primary key,
    email text not null,
    autor_id integer references autor (id)
);

-- SELECT * FROM autor;

