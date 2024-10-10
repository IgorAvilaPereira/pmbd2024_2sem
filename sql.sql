DROP DATABASE IF EXISTS universidade;

CREATE DATABASE universidade;

\c universidade;
    
CREATE TABLE departamento (
    cod serial primary key,
    nome text not null
);    

CREATE TABLE curso (
    cod serial primary key,
    nome text not null,
    departamento_cod integer references departamento (cod)
);
