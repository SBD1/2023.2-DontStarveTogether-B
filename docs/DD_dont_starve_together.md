# Dicionário de Dados (DD)

## 1 - Objetivo

O objetivo deste documento é descrever o dicionário de dados do banco de dados do jogo selecionado pela equipe: *Don’t Starve Together*, um jogo de sobrevivência extremamente difícil que se passa em uma natureza repleta de perigos e criaturas estranhas.

## Tabela Usuario

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Usuario | Armazenará os dados dos usuários |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| nomeUsuario | Nome de usuário | varchar |  | PK |
| nome | Nome do usuário | varchar |  | Not Null |
| senha | Senha do usuário | varchar |  | Not Null |

## Tabela Mundo

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Mundo | Armazenará os dados do mundo | Possui chave estrangeira para a tabela Usuario |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| tipo | Tipo de mundo | int |  | FK, Not Null |
| idUsuario | Identificador do usuário que criou o mundo | varchar |  | FK, Not Null |
| nome | Nome do mundo | varchar |  | Not Null |
| estacao | Indica a estação do ano que está no mundo | enum |("Autumn","Winter", "Spring", "Summer") | Not Null, Default "Autumn" |
| diaAtual | Número do dia atual no mundo | int |  | Not Null, Default 0 |


## Tabela Bioma

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Bioma | Armazenará os dados dos biomas |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do bioma | int |  | PK |
| nome | Nome do bioma | varchar |  | Not Null |
| descricao | Descrição do bioma | varchar |  | Not Null |

## Tabela BiomaMundo

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| BiomaMundo | Relaciona mundos e biomas | Possui chave estrangeira para as tabelas Mundo e Bioma |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idMundo | Identificador do mundo | int |  | PK, FK |
| idBioma | Identificador do bioma | int |  | PK, FK |

## Tabela Personagem

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Personagem | Armazenará os dados de um personagem, que pode ser um personagem jogável ou não |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do personagem | int |  | PK |
| nome | Nome do personagem | varchar | 30 | Not Null |
| vida | Quantidade de pontos de vida base que o personagem possui | smallint |  | Not Null |
| dano | Quantidade de dano base que o personagem causa | smallint | | Not Null |

## Tabela Personagem Jogável

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| PersonagemJogavel | Armazenará os dados de um personagem jogável  | Possui chave estrangeira para as tabela Personagem e Consumível |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idPersonagem | Identificador do personagem jogável | int |  | PK, Not Null |
| sanidade | Nível de sanidade do personagem | smallint |  | Not Null |
| fome | Nível de fome do personagem | int |  | Not Null |

## Tabela PersonagemUsuario

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| PersonagemUsuario | Armazenará a relação entre usuários e personagens jogáveis | Possui chave estrangeira para as tabelas PersonagemJogavel e Usuario |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| nomeUsuario | Nome de usuário | varchar |  | PK, FK |
| idPersonagemJogavel | Identificador do personagem jogável | integer |  | PK, FK |

## Tabela Tabela Non Player Character

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Non Player Character (NPC) | Armazenará os dados de um personagem não jogável, que podem ser inimigos ou não | Possui chave estrangeira para a tabela Personagem |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idPersonagem | Identificador do personagem | int |  | PK, FK |
| itemDropado | Item que o personagem NPC dropou| int |
| tipoNpc | Tipo do NPC | enum | ("N", "P", "H") | Not Null |

N - Neutro, P - Passivo, H - Hostil

## Tabela Instancia Personagem Jogável

| Tabela | Descrição | Observações | 
|:----:|:-----:|:-----:|
| InstanciaPC | Armazenará os dados das instâncias dos Personagens Jogáveis | Possui chave estrangeira para as tabelas PersonagemJogavel, Usuario, Mundo e Bioma |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| nomeUsuario | Identificador do nome do usuário| int |  | PK, FK |
| idPersonagemJogavel | Identificador do personagem jogável associado | int |  | PK, FK |
| idMundo | Identificador do mundo associado | int |  | PK, FK |
| idBioma | Identificador do bioma associado | int |  | PK, FK |
| vidaAtual | Quantidade de pontos de vida atual do personagem jogável | smallint |  | Not Null |
| fomeAtual | Nível de fome atual do personagem jogável | smallint |  | Not Null |
| sanidadeAtual | Nível de sanidade atual do personagem jogável | smallint |  | Not Null |
| modoFantasma | Indica se um personagem está no modo fantasma ou não (morto) | boolean |  | Not Null |
| tamanhoInventario | Indica o tamanho do inventário da instância | smallint |  | Not Null, Default 10 |

## Tabela Instancia Non Player Character

| Tabela | Descrição | Observações | 
|:----:|:-----:|:-----:|
| InstanciaNpc | Armazenará os dados das instâncias dos Personagens não jogáveis | Possui chave estrangeira para as tabelas Npc, Bioma e Mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da instância | int |  | PK |
| idNPC | Identificador do NPC associado | int |  | FK |
| idMundo | Identificador do mundo | int |  | FK, Not Null |
| idBioma | Identificador do bioma | int |  | FK, Not Null |
| vidaAtual | Quantidade de pontos de vida atual do NPC | smallint |  | Not Null |

## Tabela Equipamento

| Tabela | Descrição | Observações | 
|:----:|:-----:|:-----:|
| Equipamento | Armazenará os dados de uma peça de equipamento | Possui chave estrangeira para a tabela Item |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idItem | Identificador do equipamento | int |  | PK, FK |
| parteCorpo | Parte do corpo na qual o equipamento é equipado (Cabeça, Corpo e Mão) | smallint |  | Not Null |
| durabilidade | Quantidade de durabilidade do equipamento | smallint |  | Not Null |
| ataque | Quantidade de dano que equipamento dá | smallint | Not Null| 
| protecao | Nível de proteção (em %) do equipamento| int |  | Not Null |
| aumentaInventario | Quantidade de aumento no inventário proporcionado pelo equipamento | smallint |  | Not Null, Default 0 |


## Tabela EquipamentoPersonagem

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| EquipamentoPersonagem | Armazenará a relação de vparios equipamentos com vários personagens | Possui chave estrangeira para as tabelas InstanciaPC e Equipamento |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do relação | int |  | PK |
| idInstanciaPc | ID da instância do personagem que possui o equipamento equipado | int |  | FK |
| idEquipamento | ID do equipamento que está equipado | int |  | FK |
| durabilidadeAtual | Quantidade de durabilidade atual do equipamento | smallint |  | Not Null |


## Tabela Habilidade

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Habilidade | Armazenará os dados das habilidades dos personagens |  Possui chave estrangeira para tabela |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da habilidade | int |  | PK |
| nome | Nome da habilidade | varchar | 50 | Not Null |
| descricao | Descrição da habilidade | varchar | 200 | Not Null |
| idHabPreReq   | Identificador da habilidade pré-requisito | int |  |  |
| dano | Valor de dano da habilidade | int |  | Not Null, Default 0|

## Tabela HabilidadePersonagem

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| HabilidadePersonagem | Armazenará a relação entre  personagens e Habilidade | Possui chave estrangeira para as tabelas Personagem e Habilidade |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idPersonagem | Identificador do Personagem| int | | PK,FK | 
| idHabilidade | Identificador da Habilidade | int  | | PK,FK | 

## Tabela Item

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Item | Armazenará os dados dos itens no jogo |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do item | int |  | PK |
| nome | Nome do item | varchar | | Not Null |
| descricao | Descrição do item | varchar |  | Not Null |

## Tabela Instancia Item

| Tabela | Descrição | Observações | 
|:----:|:-----:|:-----:|
| InstanciaItem | Armazenará os dados das instâncias dos itens | Possui chave estrangeira para as tabelas Item, Bioma e Mundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da instância | int |  | PK |
| idMundo | Identificador do mundo | int |  | FK, Not Null |
| idBioma | Identificador do bioma | int |  | FK, Not Null |
| idItem | Identificador do item  | int |  | FK, Not Null|


## Tabela Dialogo

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Dialogo | Armazenará os dados dos diálogos no jogo |  | Possui chave estrangeira para tabela DialogoPersonagem|  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do diálogo | int |  | PK |
| textoFala | Texto do diálogo | varchar |  | Not Null |
| dialogoVinculo | Vínculo para outro diálogo | int | | FK |  |

## Tabela DialogoPersonagem

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| DialogoPersonagem | Armazenará a relação entre personagens e diálogos | Possui chave estrangeira para as tabelas Personagem e Dialogo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da relação | int |  | PK |
| idPersonagem | ID do personagem associado ao diálogo | int |  | FK |
| idDialogo | ID do diálogo associado ao personagem | int |  | FK |

## Tabela Alianca

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Alianca | Armazenará a relação entre instâncias de personagens jogáveis e instâncias de NPCs | Possui chave estrangeira para as tabelas InstanciaPc e InstanciaNpc |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da aliança | int |  | PK |
| idInstanciaPc | ID da instância de personagem jogável associada à aliança | int |  | FK |
| idInstanciaNpc | ID da instância de NPC associada à aliança | int |  | FK |

## Tabela Receita

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Receita | Armazenará os dados das receitas de craft | Possui chave estrangeira para as tabelas Item e Colocavel |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| itemReceita | Identificador da receita de craft | int |  | PK |
| item1 | Chave estrangeira para o item 1 | int |  | FK |
| item2 | Chave estrangeira para o item 2 | int |  | FK |
| item3 | Chave estrangeira para o item 3 | int |  | FK |
| estacaoCraft | Chave estrangeira para eEstacaoCraft | int |  | FK | |Not Null|
| quantidade1 | Quantidade do item 1 necessário na receita | smallint |  | Not Null |
| quantidade2 | Quantidade do item 2 necessário na receita | smallint | 
| quantidade3 | Quantidade do item 3 necessário na receita | smallint | 


## Tabela Consumivel

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Consumivel | Armazenará os dados dos itens consumíveis | Possui chave estrangeira para a tabela Item |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idItem | Identificador do item consumível | int |  | PK, FK |
| vida | Quantidade de vida que o consumível fornece | smallint |  | Not Null |
| sanidade | Quantidade de sanidade que o consumível fornece | smallint |  | Not Null |
| fome | Quantidade de fome que o consumível fornece | smallint |  | Not Null |

## Tabela Colocavel

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Colocavel | Armazenará os dados dos itens colocáveis | Possui chave estrangeira para a tabela Item |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idItem | Identificador do item colocável | serial |  | PK, FK |
| durabilidade | Durabilidade do item colocável | int |  | |
| eEstacaoCraft | Indica se o item colocável é uma estação de craft | boolean |  | Not Null, Default false |

## Tabela InstanciaColocavel

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| InstanciaColocavel | Armazenará os dados das instâncias dos itens colocáveis | Possui chave estrangeira para as tabelas Colocavel,Mundo e Bioma |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da instância do colocável | int |  | PK |
| idColocavel | Identificador do item colocável associado | int |  | FK |
| idMundo | Identificador do mundo associado | int |  | FK |
| idBioma | Identificador do bioma associado | int |  | FK |
| durabilidadeAtual | Durabilidade atual da instância | smallint |  | Not Null |

## Tabela Inventario

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Inventario | Armazenará os dados dos itens no inventário dos personagens jogáveis | Possui chave estrangeira para as tabelas Item e InstanciaPc |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idItem | Identificador do item | int |  | PK, FK |
| nomeUsuario | Nome do usuário | int |  | PK, FK |
| idInstanciaPc | Identificador da instância do personagem jogável | int |  | PK, FK |
| quantidade | Quantidade do item no inventário | smallint |  | Not Null |

# Histórico de Versão

| Versão | Data | Descrição | Autor |
| :-----: | :------: | ------- | -------- |
| 1.0 | 02/10/2023 | Criação do Documento (apenas criou template) | [Levi Queiroz](https://github.com/LeviQ27) |
| 1.3 | 10/12/2023 | Reverte atualizações antigas - (não estava atualizado) e atualiza com modelo atual | [Luis Bruno](https://github.com/lbrunofidelis) |