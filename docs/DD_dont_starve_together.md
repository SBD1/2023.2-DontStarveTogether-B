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

## Tabela Instancia

| Tabela | Descrição | Observações | 
|:----:|:-----:|:-----:|
| Instancia | Armazenará os dados das instâncias dos NPC | Possui chave estrangeira para NPC |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da instância | int | ------ | PK |
| idNPC | Identificador do NPC associado | int | ------ | FK |
| nome | Nome da instância | Varchar | 50 | Not Null |
| descricao | Descrição da instância | Varchar | 200 | Not Null |
| localizacao | Localização da instância | Varchar | 200 | Not Null |


## Tabela Equipamento

| Tabela | Descrição |
|:----:|:-----:|
| Equipamento | Armazenará os dados de uma peça de equipamento |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do equipamento | int | ------ | PK |
| nome | Nome do equipamento | varchar | 50 | Not Null |
| descricao | Descrição do equipamento | varchar | 200 | Not Null |
| parteCorpo | Parte do corpo na qual o equipamento é equipado (Cabeça, Corpo e Mão) | varchar | 50 | Not Null |
| durabilidade | Quantidade de durabilidade do equipamento | float | ------ | Not Null |
| protecao | Nível de proteção (em %) do equipamento| int | ------ | Not Null |


## Tabela EquipamentoPersonagem

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| EquipamentoPersonagem | Armazenará a relação de vparios equipamentos com vários personagens | Possui chave estrangeira para as tabelas PC e Equipamento |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do relação | int |  | PK |
| idPersonagem | ID do personagem que possui o equipamento equipado | int | ------ | FK |
| idEquipamento | ID do equipamento que está equipado | int | ------ | FK |

## Tabela Craft

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Craft | Armazenará os dados das receitas de craft | Possui chave estrangeira para as tabelas PC e Equipamento |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da receita de craft | int | ------- | PK |
| idItem | Chave estrangeira para o item  | Int | ------ | FK |
| idEstacaoCraft | Chave estrangeira para a estação de craft associada | int | ------ | FK |

## Tabela EstacaoCraft

| Tabela | Descrição |
|:----:|:-----:|
| EstacaoCraft | Armazenará das estações de craft no jogo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da estação de craft | int |  | PK |
| nome | Nome da estação de craft | varchar | 50 | Not Null |
| descricao | Descrição da estação de craft | varchar | 200 | Not Null |
| localizacao | Localização da estação de craft | varchar | 50 | Not Null |

## Tabela Habilidade

| Tabela | Descrição |
|:----:|:-----:|
| Habilidade | Armazenará os dados das habilidades dos personagens |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da habilidade | int |  | PK |
| nome | Nome da habilidade | varchar | 50 | Not Null |
| descricao | Descrição da estação de craft | varchar | 200 | Not Null |
| eOfensiva | Habilidade ofensiva (Sim ou Não) | boolean | ------ | Not Null |
| dano | Valor de dano da habilidade | int | ------ | ------ |
| casting | Tempo de lançamento da habilidade | int | ------ | Not Null |
| recursoGerado | Recurso gerado pela habilidade | varchar | 50 | ------ |
## Tabela Item

| Tabela | Descrição |
|:----:|:-----:|
| Item | Armazenará os dados dos itens no jogo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do item | int |  | PK |
| nome | Nome do item | varchar | 50 | Not Null |
| tipo | Tipo do item | varchar | 50 | Not Null |
| quantidade | Quantidade de itens disponíveis | int | ------ | Not Null |


# Histórico de Versão

| Versão | Data | Descrição | Autor |
| :-----: | :------: | ------- | -------- |
| 1.0 | 02/10/2023 | Criação do Documento | [Levi Queiroz](https://github.com/LeviQ27) |
| 1.1 | 02/10/2023 | Criação das Tabelas | [Levi Queiroz](https://github.com/LeviQ27) [Luis Bruno](https://github.com/lbrunofidelis) [Andre Goretti](https://github.com/AGoretti) |