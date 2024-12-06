### Lista de Exercícios de SQL Básico

#### Exercícios de Consulta (SELECT)

1. **Selecione todos os usuários cadastrados na tabela `usuario`.**

```sql
SELECT * FROM usuario;
```

2. **Selecione todos os artigos da tabela `artigo` ordenados pelo título em ordem alfabética.**

```sql
SELECT * FROM artigo ORDER BY titulo;
```

3. **Selecione todos os usuários que têm o bairro preenchido.**

```sql
SELECT * FROM usuario WHERE bairro IS NOT NULL;
```

4. **Selecione todos os artigos publicados entre duas datas específicas.**

```sql
SELECT * FROM artigo WHERE data_hora BETWEEN '2024-01-01' AND '2024-12-31';
```

5. **Selecione todos os usuários que nasceram antes do ano 2000.**

```sql
SELECT * FROM usuario WHERE data_nascimento < '2000-01-01';
```

6. **Selecione todos os artigos que pertencem à categoria com ID 1.**

```sql
SELECT * FROM artigo WHERE categoria_id = 1;
```

7. **Selecione todos os usuários cujos nomes começam com a letra 'I'.**

```sql
SELECT * FROM usuario WHERE nome LIKE 'I%';
```

8. **Selecione todos os telefones associados ao usuário com ID 1.**

```sql
SELECT * FROM telefone WHERE usuario_id = 1;
```

9. **Selecione todos os artigos que contêm a palavra 'texto' no campo `texto`.**

```sql
SELECT * FROM artigo WHERE texto LIKE '%texto%';
```

10. **Selecione todos os usuários que têm o CEP '12345678'.**
 
```sql
SELECT * FROM usuario WHERE cep = '12345678';
```

#### Exercícios de Atualização (UPDATE)

1. **Atualize o nome do usuário com ID 1 para 'Igor Pereira'.**

```sql
UPDATE usuario SET nome = 'Igor Pereira' WHERE id = 1;
```

2. **Atualize o bairro do usuário com ID 1 para 'Centro'.**

```sql
UPDATE usuario SET bairro = 'Centro' WHERE id = 1;
```

3. **Atualize o título do artigo com ID 1 para 'Novo Título'.**

```sql
UPDATE artigo SET titulo = 'Novo Título' WHERE id = 1;
```

4. **Atualize a senha do usuário com email 'igor.pereira@riogrande.ifrs.edu.br' para 'nova_senha'.**

```sql
UPDATE usuario SET senha = md5('nova_senha') WHERE email = 'igor.pereira@riogrande.ifrs.edu.br';
```

5. **Atualize o número de telefone do telefone com ID 1 para '987654321'.**
    
```sql
UPDATE telefone SET nro = '987654321' WHERE id = 1;
```

#### Exercícios de Deleção (DELETE)

1. **Delete o usuário com ID 1.**
    
```sql
DELETE FROM usuario WHERE id = 1;
```

2. **Delete todos os artigos que foram publicados antes de 2024.**

```sql
DELETE FROM artigo WHERE data_hora < '2024-01-01';
```

3. **Delete todos os comentários associados ao artigo com ID 1.**

```sql
DELETE FROM comentario WHERE artigo_id = 1;
```

4. **Delete todas as curtidas associadas ao usuário com ID 1.**

```sql
DELETE FROM curtida WHERE usuario_id = 1;
```

5. **Delete todos os telefones associados ao usuário com ID 1.**

```sql
DELETE FROM telefone WHERE usuario_id = 1;
```

#### Exercícios de DDL (Data Definition Language)

1. **Adicione uma coluna `telefone` na tabela `usuario`.**

```sql
ALTER TABLE usuario ADD COLUMN telefone character varying(15);
```

2. **Remova a coluna `bairro` da tabela `usuario`.**

```sql
ALTER TABLE usuario DROP COLUMN bairro;
```

3. **Crie uma nova tabela chamada `tag` com as colunas `id` (serial, chave primária) e `nome` (text, não nulo).**

```sql
CREATE TABLE tag (
    id serial PRIMARY KEY,
    nome text NOT NULL
);
```

4. **Adicione uma restrição de unicidade na coluna `email` da tabela `usuario`.**

```sql
ALTER TABLE usuario ADD CONSTRAINT unique_email UNIQUE (email);
```

5. **Renomeie a tabela `telefone` para `contato_telefone`.**

```sql
ALTER TABLE telefone RENAME TO contato_telefone;
```

#### Exercícios de Consulta (SELECT)

11. **Selecione todos os usuários que se registraram no sistema nos últimos 30 dias.**
 
```sql
SELECT * FROM usuario WHERE data_registro >= current_date - interval '30 days';
```

12. **Selecione todos os artigos que foram publicados no mês de janeiro de 2024.**

```sql
SELECT * FROM artigo WHERE data_hora BETWEEN '2024-01-01' AND '2024-01-31';
```

13. **Selecione todos os usuários que têm um email que termina com 'ifrs.edu.br'.**
 
```sql
SELECT * FROM usuario WHERE email LIKE '%ifrs.edu.br';
```

14. **Selecione todos os artigos cujo título contém a palavra 'tutorial'.**
 
```sql
SELECT * FROM artigo WHERE titulo LIKE '%tutorial%';
```

15. **Selecione todos os usuários que têm um número de telefone cadastrado.**
 
```sql
SELECT * FROM usuario WHERE id IN (SELECT usuario_id FROM telefone);
```

16. **Selecione todos os artigos que foram publicados no ano de 2024.**

```sql
SELECT * FROM artigo WHERE EXTRACT(YEAR FROM data_hora) = 2024;
```

17. **Selecione todos os usuários que têm o nome 'Ana' ou 'Maria'.**
 
```sql
SELECT * FROM usuario WHERE nome IN ('Ana', 'Maria');
```

18. **Selecione todos os artigos que foram publicados após as 18:00.**

```sql
SELECT * FROM artigo WHERE EXTRACT(HOUR FROM data_hora) > 18;
```

19. **Selecione todos os usuários que têm um CEP que começa com '123'.**

```sql
SELECT * FROM usuario WHERE cep LIKE '123%';
```

20. **Selecione todos os artigos que foram publicados nos últimos 7 dias.**

```sql
SELECT * FROM artigo WHERE data_hora >= current_timestamp - interval '7 days';
```

#### Exercícios de Atualização (UPDATE)

6. **Atualize o email do usuário com ID 1 para 'novo.email@example.com'.**

```sql
UPDATE usuario SET email = 'novo.email@example.com' WHERE id = 1;
```

7. **Atualize o título do artigo com ID 1 para 'Título Atualizado'.**

```sql
UPDATE artigo SET titulo = 'Título Atualizado' WHERE id = 1;
```

8. **Atualize o número de telefone do telefone com ID 2 para '123456789'.**

```sql
UPDATE telefone SET nro = '123456789' WHERE id = 2;
```

9. **Atualize a data de registro do usuário com ID 1 para a data atual.**

```sql
UPDATE usuario SET data_registro = current_date WHERE id = 1;
```

10. **Atualize o conteúdo do comentário com ID 1 para 'Conteúdo Atualizado'.**

```sql
UPDATE comentario SET conteudo = 'Conteúdo Atualizado' WHERE id = 1;
```

#### Exercícios de Deleção (DELETE)

6. **Delete todos os usuários que não têm um email cadastrado.**

```sql
-- obs: pode ser necessario criar uma transacao
DELETE FROM usuario WHERE email IS NULL;
```

7. **Delete todos os artigos que foram publicados antes de 2023.**

```sql
-- obs: pode ser necessario criar uma transacao
DELETE FROM artigo WHERE data_hora < '2023-01-01';
```

8. **Delete todos os comentários que foram feitos no artigo com ID 1.**

```sql
-- obs: pode ser necessario criar uma transacao
DELETE FROM comentario WHERE artigo_id = 1;
```

9. **Delete todas as curtidas feitas pelo usuário com ID 1.**

```sql
-- obs: pode ser necessario criar uma transacao
DELETE FROM curtida WHERE usuario_id = 1;
```

10. **Delete todos os telefones que não estão associados a nenhum usuário.**

```sql
-- obs: pode ser necessario criar uma transacao
DELETE FROM telefone WHERE usuario_id IS NULL;
```

#### Exercícios de DDL (Data Definition Language)

6. **Adicione uma coluna `data_atualizacao` na tabela `artigo` com o tipo `timestamp`.**
 
```sql
ALTER TABLE artigo ADD COLUMN data_atualizacao timestamp;
```

7. **Remova a coluna `nro` da tabela `usuario`.**

```sql
ALTER TABLE usuario DROP COLUMN nro;
```

8. **Crie uma nova tabela chamada `tag_artigo` com as colunas `id` (serial, chave primária), `artigo_id` (integer, chave estrangeira) e `tag_id` (integer, chave estrangeira).**

```sql
CREATE TABLE tag_artigo (
    id serial PRIMARY KEY,
    artigo_id integer REFERENCES artigo(id),
    tag_id integer REFERENCES tag(id)
);
```

9. **Adicione uma restrição de não nulo na coluna `bairro` da tabela `usuario`.**

```sql
ALTER TABLE usuario ALTER COLUMN bairro SET NOT NULL;
```

10. **Renomeie a tabela `curtida` para `likes`.**

```sql
ALTER TABLE curtida RENAME TO likes;
```