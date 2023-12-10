# Dependências funcionais e Normalização

## Tabela Usuario
### Chave: nomeUsuario. Candidata: email.
- nomeUsuario → nome
- nomeUsuario → senha
- email → nome
- email → senha

#### 1FN: não há colunas multivaloradas na tabela

#### 2FN: todas as colunas possuem dependência funcional com a totalidade de cada chave candidata

#### 3FN: a chave primária `nomeUsuario` e a chave candidata `email` garantem a ausência de dependências transitivas, fazendo que os atributos `nome` e `senha`, sejam diretamente dependente dessas chaves. 

#### BCNF: a chave primária `nomeUsuario` é uma superchave candidata e a chave candidata `email` também é uma superchave candidata, e não são determinadas pelos outros campos, logo, a tabela `Usuario` está na BCNF. 

#### 4FN: só se aplica em tabelas com chaves primárias compostas por três colunas ou mais (esta linha será omitida em todas as tabelas que não atendem esses requisitos)

## Tabela TipoMundo
### Chave: id
- id → nome
- id → quantidadeBiomas

#### 1FN: não há colunas multivaloradas na tabela (esta linha será omitida nas próximas tabelas, por ser a forma normal mais trivial)

#### 2FN: todas as colunas possuem dependência funcional com a totalidade de cada chave candidata

#### 3FN: a chave primária `id` garante a ausência de dependências transitivas, fazendo que os atributos `nome` e `quantidadeBiomas`, sejam diretamente dependente dessas chaves. 

#### BCNF: a chave primária `id` é uma (e única) superchave candidata, e não pode ser determinada por outro atributo, logo, a tabela `TipoMundo` está na BCNF.

## Tabela Mundo
### Chave: id.
- id → nome
- id → idUsuario
- id → tipo
- id → estacao
- id → temEstrada
- id → diaAtual

#### 2FN: todas as colunas possuem dependência funcional com a totalidade de cada chave candidata

#### 3FN: a chave primária `id` garante a ausência de dependências transitivas, fazendo que os atributos sejam diretamente dependente dessas chaves. 

#### BCNF: a chave primária `id` é uma (e única) superchave candidata, e não pode ser determinada por outro atributo, logo, a tabela `Mundo` está na BCNF.

## Tabela Bioma
### Chave: id.
- id → nome
- id → descricao

#### 2FN: todas as colunas possuem dependência funcional com a totalidade de cada chave candidata

#### 3FN: a chave primária `id` garante a ausência de dependências transitivas, fazendo que os atributos sejam diretamente dependente dessas chaves. 

#### BCNF: a chave primária `id` é uma (e única) superchave candidata, e não pode ser determinada por outro atributo, logo, a tabela `Bioma` está na BCNF.

## Tabela BiomaMundo
### Chave Composta: idMundo/idBioma. Candidatas: idMundo, idBioma
- idMundo → idBioma
- idBioma → idMundo

#### 2FN: todas as colunas possuem dependência funcional com a totalidade de cada chave candidata. Com `idMundo` é possível encontrar os Biomas deste mundo, e com `idBioma` é possível identificar em quais mundos o Bioma está presente

#### 3FN: os atributos (próprias chaves pk fk) são totalmente dependentes da chave primária `idMundo idBioma`

| Versão | Data | Descrição | Autor |
| :-----: | :------: | ------- | -------- |
| 1.0 | 10/11/2023 | Cria doc e normalização até BiomaMundo | [Luis Bruno](https://github.com/lbrunofidelis) |
