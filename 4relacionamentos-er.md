# Relacionamento - ER

Um relacionamento é uma associação entre as **entidades**.
Os dados devem estar armazenados e estarem relacionados na base de dados para que possamos utilizá-los eficientemente.

Ex: Esse relacionamento entre dados é que nos permite descobrir, dada duas entidades como **Aluno** e **Turma**, a qual turma um aluno pertence.

![image](https://github.com/user-attachments/assets/e0a78b5f-521d-4b1b-89a5-d338ddb6d896)

Um relacionamento é representado por um losango com o nome do relacionamento no centro. O nome do 
relacionamento representa a relação que existe entre os objetos das entidades. O nome do relacionamento pode ser um **verbo** como, por exemplo, **pertence**, **leciona**, **estuda**, **possui**, etc; ou também pode ser uma composição dos nomes das entidades como por exemplo **Aluno_Turma** em vez de **pertence**.


Um relacionamento pode ter atributos. Esses atributos são denominados **atributos descritivos**.

Ex: Imagine que seja necessário armazenar a **data** que um **professor** lecionou determinada disciplina. O **atributo** **data** **não pertence nem à entidade Professor e nem à entidade Disciplina**. Esse atributo pertence ao relacionamento **leciona**, ou seja, é um atributo do relacionamento. E ele só deve ser preenchido com um valor, quando for feita a relação entre **professor** e **disciplina**.

![image](https://github.com/user-attachments/assets/fc17d054-928f-4cf7-b27b-75d82205810d)


## Cardinalidade


As restrições de mapeamento ou cardinalidade expressam o número de objetos de uma entidade ao qual outra entidade pode ser associada, via um relacionamento.

Para descobrir a cardinalidade de um relacionamento, a pergunta que deve ser feita é:**"Se eu pegar um único objeto da minha entidade X, a quantos objetos da entidade Y ele pode se associar?"**


Isto é, se eu pegar o objeto *Elaini* da entidade **Professor**, esse objeto *Elaini* poderá lecionar quantas disciplinas da entidade **Disciplina**? E se eu pegar o objeto *Banco de dados* da entidade **Disciplina**, a quantos professores ele poderá estar relacionado?

Esse número de associações entre objetos pode ser 0,1 ou vários (representado por N). No caso do exemplo de Professor e Disciplina a cardinalidade do modelo é N para N, permitindo que um professor lecione várias disciplinas e que uma disciplina seja ministrada por mais de um professor. Por exemplo, a disciplina de Banco de dados poderia ser ministrada pela profª. Elaini e pelo prof. João. Além de Banco de dados,a profª. Elaini poderia lecionar também, a disciplina de Análise de Projetos.


A cardinalidade de relacionamentos podem ser de 3 tipos: **Um para Um**, **Um para Muitos** e **Muitos para Muitos**.

## Cardinalidade Um para Um (1:1)

A cardinalidade (1:1) ocorre quando um objeto de uma entidade pode se relacionar a apenas um objeto de outra entidade e vice-e-versa. Imagine que você esteja desenvolvendo um sistema para uma rede de escolas. Cada escola terá um diretor (que é um professor da escola), e este diretor só poderá dirigir uma escola. Sendo assim, o relacionamento **dirige** entre as entidades **Escola** e **Professor** será 1:1.

O relacionamento pode ser lido da seguinte forma: um professor dirige uma escola e uma escola é dirigida por um professor.

## Cardinalidade Um para Muitos (1:N)


A cardinalidade Um para Muitos ocorre quando um objeto de uma entidade pode se relacionar a vários objetos da outra entidade, mas o contrário não é verdadeiro. Imagine um professor possa trabalhar em apenas uma escola da rede municipal e que uma escola possa ter vários professores. Nesta situação, teremos um relacionamento 1:N.


## Cardinalidade Muitos para Muitos 

A cardinalidade Muitos para Muitos (N:N) ocorre quando um objeto de uma entidade pode se relacionar a vários objetos da outra entidade e vice-e-versa. Imagine que um professor possa ministrar aulas em várias disciplinas e que uma disciplina possa ser ministrada por vários professores. Nesse caso, temos um relacionamento N:N.


## Resumo - Cardinalidade

![image](https://github.com/user-attachments/assets/304e30af-9180-4aaa-a790-b1560b19d819)



## Relacionamento Ternário ou Maiores


Até agora, todos os exemplos apresentados são de relacionamentos binários, ou seja, entre duas entidades. No entanto, um relacionamento pode ocorrer também entre três ou mais entidades.

Considere o exemplo em que um professor pode ministrar disciplinas para diferentes turmas. Nesta situação, um professor poderia dar aula de uma ou mais disciplinas, e poderiam existir um ou mais professores que dessem a mesma disciplina em diferentes turmas. Com a mudança de ano, o professor que dava aula da disciplina de banco de dados na turma A poderia pegar a mesma disciplina para a turma B, e deixar a turma A para outro professor.

Para que as informações possam ser armazenadas e recuperadas de forma completa, teremos que criar um relacionamento ternário entre as entidades, conforme figura abaixo:


![image](https://github.com/user-attachments/assets/9aa9869f-de77-484d-a35e-0ce19099badf)

Poderíamos tentar criar três relacionamentos binários para o problema descrito acima, no entanto, se fizermos isso, não teremos as informações de forma completa como a temos no relacionamento ternário.

O relacionamento **ministra** possui ainda o atributo descritivo **ano** que permite distinguir qual foi o professor que ministrou determinada disciplina para uma turma em um determinado ano.

Obs: relacionamentos maiores que ternários devem ser evitados (se possível) porque são difíceis de serem compreendidos e de serem implementados, tornando a relação bastante complexa.

## Relacionamento Recursivo

Este tipo especial de relacionamento é aquele que relaciona objetos de uma mesma entidade. Esse tipo de relacionamento é denominado de **relacionamento recursivo** ou **autorrelacionamento**.

Imagine que existam alguns poucos alunos que representam grupos de outros alunos em reuniões e assuntos estudantis. Nesse caso, um objeto aluno representa vários objetos dentro da mesma entidade.  A figura abaixo apresenta o relacionamento **representante** como um relacionamento recursivo.

![image](https://github.com/user-attachments/assets/2e017ea2-c18e-4ac3-bf88-875156b8b9d6)

## Herança (Generalização/Especialização)

Herança (ou Especialização) consiste na subdivisão de uma entidade mais genérica (ou entidade pai) em um conjunto de entidades especializadas (ou entidades filhas).

Isso ocorre quando um conjunto de entidades pode conter subgrupos de entidades com atributos específicos a cada subgrupo. Esse processo tem por finalidade refinar o esquema da base de dados, tornando-o mais específico.

A figura abaixo apresenta um exemplo de especialização entre as entidades **Pessoa**, **Professor** e **Aluno**.

![image](https://github.com/user-attachments/assets/036acada-4d94-44f5-a80f-88b99557036f)

**Observe que a herança/especialização é indicada no diagrama por um triângulo**, e as entidades filhas estão relacionadas com a entidade pai por meio do triângulo.

As entidades *herdam* todos os atributos da entidade pai e, portanto, não se devem repetir atributos da entidade pai nas entidades filhas. **Isso significa que os atributos que aparecem na entidade pai são os atributos que existem em comum entre as entidades filhas**. 

**Também não é necessário indicar um atributo identificador para as entidades filhas. O atributo identificador para as entidades filhas será definida no modelo relacional (modelagem lógica)**.

Uma especialização pode ter quantas entidades filhas forem necessárias, inclusive uma, se for o caso. Além disso, uma entidade filha pode também ser entidade pai para outra especialização.

### Tipos


<!--Agora que modelamos as especializações da entidade Cliente, podemos complementar nosso modelo indicando qual o tipo de especialização está modelado. -->

<!--Existem três tipos de especialização que podemos modelar e são essas:-->

* **Total (T):** <!--Esse tipo de especialização é quando modelamos todas as características de uma entidade. No nosso modelo abaixo podemos dizer que a especialização das entidades Cliente e Pessoa Juridica é total, pois todas as suas características estão no modelo.-->

![image](https://github.com/user-attachments/assets/e8cb1cf1-81a2-4062-b64d-e9a3a623b34d)

* **Parcial (P):** <!--Esse tipo de especialização é quando apenas modelamos as principais características de uma entidade, deixando algumas menos importantes de fora do modelo. --> <!--Mas a característica que ficar de fora deve constar no dicionário de dados.-->

![image](https://github.com/user-attachments/assets/aa501346-1f63-412a-812d-d3f177c5584f)

<!--
* **Exclusiva (E):** Esse tipo de especialização indica que uma entidade possui uma única característica de uma única vez, ou seja se um cliente é uma pessoa física ele não pode ser uma pessoa jurídica ao mesmo tempo e vice-versa ou um livro que não pode ser nacional e importado ao mesmo tempo. Caso venha ocorrer de uma entidade ter características diferentes ao mesmo tempo, não indicamos a exclusividade.
-->

No exemplo, a especialização é um caso de **total** se considerarmos que uma **Pessoa** cadastrada deverá ser sempre um **Aluno** ou um **Professor** (exclusiva) <!-- e que outras especializações que existem em escolas ou universidades como, por exemplo, **Funcionário** não são necessárias para o modelo e que nunca farão parte-->. Neste tipo de especialização, **recomenda-se inserir um "t" minúsculo ao lado do símbolo que representa a especialização**. Em situações onde é possível que haja **Pessoas** que não sejam nem **Aluno** nem **Professor** cadastradas, a especilização/herança é considerada **parcial**. **Assim, neste caso, deve-se colocar um "p" minúsculo ao lado do símbolo que representa tal relacionamento**. <!--Obviamente, especializações parciais também podem ser **exclusivas**.-->


## Entidade Associativa (Agregação)

A **agregação** ou **entidade associativa** ocorre quando precisamos relacionar dois relacionamentos entre si.

Imagine que tenhamos duas entidades **Cliente** e **Produto** ligadas pelo relacionamento **Compra**. Agora, suponha que tenhamos que modificar esse modelo de modo que seja necessário saber quantas prestações serão pagas em uma compra. Relacionar a entidade **Prestação** com **Cliente** ou com **Produto** não faz sentido, uma vez que as prestações serão referentes à compra efetuada. Sendo assim, a entidade **Prestação** deve se relacionar à **Compra**, como mostra a figura abaixo. O retângulo desenhado em volta do relacionamento indica a **agregação**.

![image](https://github.com/user-attachments/assets/26967fad-fe10-4ff3-976d-aae6dbd2dcc4)


É possível também reescrever o diagrama ER anterior sem utilizar agregação (ou entidade associativa). Neste caso, o relaciomento **Compra** seria transformado em uma **entidade** que poderia ser relacionada à **Prestação**, conforme figura abaixo.


![image](https://github.com/user-attachments/assets/6ae967fc-9585-4f5e-8696-6b7e6406b68f)

É importante ressaltar que um mesmo problema pode ter diferentes interpretações, e assim gerar diagramas diferenciados. Isso não significa que apenas um dos diagramas está certo.


# Resumo 

![image](https://github.com/user-attachments/assets/b54cb7cd-c4ab-4fc6-9fb1-0957aaa2b1fa)