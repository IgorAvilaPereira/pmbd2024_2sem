DROP DATABASE IF EXISTS revisao;

CREATE DATABASE revisao;

\c revisao;

CREATE TABLE pessoa (
    cpf character(11) primary key,
    nome character varying(150) not null,
    data_nascimento date,
    rua text,
    bairro text,
    cep text,
    nro text
);
INSERT INTO pessoa (cpf, nome) VALUES ('11111111111',  'IGOR');
INSERT INTO pessoa (cpf, nome) VALUES ('33333333333',  'IGOR WIFE');
INSERT INTO pessoa (cpf, nome) VALUES ('44444444444',  'FERNANDÃO');

CREATE TABLE montadora (
    cod serial primary key,
    nome text not null
);

INSERT INTO montadora (nome) values ('vw');

CREATE TABLE modelo (
    cod serial primary key,
    nome text not null,
    montadora_cod integer references montadora (cod)
);

INSERT INTO modelo (nome, montadora_cod) values ('Gol', 1);

CREATE TABLE carro (
    cod serial primary key,
    km real,
    placa character(7),
    modelo_cod integer references modelo (cod),
    pessoa_cpf character(11) references pessoa (cpf)
);
INSERT INTO carro (modelo_cod, pessoa_cpf) values (1, '11111111111');
INSERT INTO carro (modelo_cod, pessoa_cpf) values (1, '11111111111');
INSERT INTO carro (modelo_cod, pessoa_cpf) values (1, '11111111111');
INSERT INTO carro (modelo_cod, pessoa_cpf) values (1, '11111111111');
INSERT INTO carro (modelo_cod, pessoa_cpf) values (1, '11111111111');
INSERT INTO carro (modelo_cod, pessoa_cpf) values (1, '11111111111');

CREATE TABLE telefones (
    telefone character varying(10) primary key,
    pessoa_cpf character(11) references pessoa (cpf)
);

CREATE TABLE dependente (
    cpf character(11) primary key,
    nome character varying(150) not null
);
INSERT INTO dependente (cpf, nome) values ('22222222222', 'Igor Jr');

CREATE TABLE pessoa_dependente (
    pessoa_cpf character(11) references pessoa (cpf),
    dependente_cpf character(11) references dependente (cpf),
    funcao text check (funcao in ('mãe', 'pai')),
    primary key (pessoa_cpf, dependente_cpf)
);
INSERT INTO pessoa_dependente (pessoa_cpf, dependente_cpf, funcao) values ('11111111111', '22222222222', 'pai');
INSERT INTO pessoa_dependente (pessoa_cpf, dependente_cpf, funcao) values ('33333333333', '22222222222', 'mãe');










