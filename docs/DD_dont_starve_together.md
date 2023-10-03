# Dicionário de Dados (DD)

## 1 - Objetivo

O objetivo deste documento é descrever o dicionário de dados do banco de dados do jogo selecionado pela equipe: *Don’t Starve Together*, um jogo de sobrevivência extremamente difícil que se passa em uma natureza repleta de perigos e criaturas estranhas.

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |

## Tabela Bioma

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Bioma | Armazenará os dados do bioma, que é o ambiente ou habitat para as criaturas presentes no mundo do jogo. | Possui chave estrangeira para Mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do bioma | int |  | PK |
| nome | Nome do bioma| varchar | 50 | Not Null |
| estacao | A estação atual no mundo (por exemplo, verão, inverno, outono, primavera) | varchar | 50 | Not Null |

## Tabela Personagem

| Tabela | Descrição |
|:----:|:-----:|
| Personagem | Armazenará os dados de um personagem, que pode ser um personagem jogável ou não |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do personagem | int |  | PK |
| nome | Nome do personagem | varchar | 50 | Not Null |
| descricao | Descrição do personagem, tais como história, gostos, vantagens e/ou desvantagens  | varchar | 200 | Not Null |
| vida | Quantidade de pontos de vida base que o personagem possui | int |  | Not Null |

## Tabela Player Character

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Player Character (PC) | Armazenará os dados de um personagem jogável  | Possui chave estrangeira para a tabela Item |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do personagem| int |  | PK |
| idComidaFavorita |  | int |  | FK |
| vida | Quantidade atual de vida do personagem | int || Not Null |
| fome | Nível de fome do personagem | int || Not Null |
| sanidade | Nível de sanidade do personagem | int || Not Null |
| modoFantastma | Indica se um personagem está no modo fantasma ou não (morto). Um PC fica no modo fantasma até ser ressussitado | boolean || Not Null |

## Tabela Tabela Non Player Character

| Tabela | Descrição |
|:----:|:-----:|
| Non Player Character (NPC) | Armazenará os dados de um personagem não jogável, que podem ser inimigos ou não |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do personagem | int |  | PK |
| vida | Indica a quantidade de pontos de vida atual do NPC | int |  | Not Null |
| eHostil | Se o atributo hostil for verdadeiro, o NPC ataca qualquer PC que avistar | boolean || Not Null |
| eNeutro | Se o atributo neutro for verdadeiro, o NPC só ataca o PC quando for atacado | boolean || Not Null |
| ePassivo | Se o atributo passivo for verdadeiro, o NPC não ataca o PC em nenhuma ocasião | boolean || Not Null |
| eBoss | Indica que o NPC é um boss | boolean || Not Null |
| dialogo | Atributo que faz o diálogo do NPC, caso exista | varchar | 300 | Not Null |

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |

## Tabela Mundo

| Tabela | Descrição |
|:----:|:-----:|
| Mundo | Armazenará os dados do mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| nome | Nome do mundo | varchar | 50 | Not Null |
| tamanho | Tamanho do mundo (small, medium, large (default) e huge) |  || Not Null |


# Histórico de Versão

| Versão | Data | Descrição | Autor |
| :-----: | :------: | ------- | -------- |
| 1.0 | 02/10/2023 | Criação do Documento | [Levi Queiroz](https://github.com/LeviQ27) |
| 1.1 | 02/10/2023 | Criação das Tabelas | [Levi Queiroz](https://github.com/LeviQ27) [Luis Bruno](https://github.com/lbrunofidelis) [Andre Goretti](https://github.com/AGoretti) |