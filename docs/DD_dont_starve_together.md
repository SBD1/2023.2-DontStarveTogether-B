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
| email | Endereço de e-mail | varchar |  | Unique, Not Null |
| senha | Senha do usuário | varchar |  | Not Null |

## Tabela Mundo

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Mundo | Armazenará os dados do mundo | Possui chave estrangeira para as tabelas TipoMundo e Usuario |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do mundo | int |  | PK |
| tipo | Tipo de mundo | int |  | FK, Not Null |
| idUsuario | Identificador do usuário que criou o mundo | varchar |  | FK, Not Null |
| nome | Nome do mundo | varchar |  | Not Null |
| estacao | Indica a estação do ano que está no mundo | enum |("Autumn","Winter", "Spring", "Summer") | Not Null, Default "Autumn" |
| temEstrada | Define se o mundo deve gerar estradas ou não | boolean |  | Not Null |
| diaAtual | Número do dia atual no mundo | int |  | Not Null, Default 0 |


| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| TipoMundo | Armazenará os tipos de mundo |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do tipo do mundo | int |  | PK |
| nome | Nome do bioma| varchar |  | Not Null |
| quantidadeBiomas | Quantidade de biomas | integer | ------ | Not Null |

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
| idMundo | Identificador do mundo | int |  | FK, Not Null |
| idBioma | Identificador do bioma | int |  | FK, Not Null |

## Tabela Personagem

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Personagem | Armazenará os dados de um personagem, que pode ser um personagem jogável ou não |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do personagem | int |  | PK |
| nome | Nome do personagem | varchar | 30 | Not Null |
| descricao | Descrição do personagem, tais como história, gostos, vantagens e/ou desvantagens  | varchar | 255 | Not Null |
| vida | Quantidade de pontos de vida base que o personagem possui | smallint |  | Not Null |

## Tabela Personagem Jogável

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| PersonagemJogavel | Armazenará os dados de um personagem jogável  | Possui chave estrangeira para as tabela Personagem e Consumível |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idPersonagem | Identificador do personagem jogável | int |  | PK, Not Null |
| fome | Nível de fome do personagem | int |  | Not Null |
| sanidade | Nível de sanidade do personagem | smallint |  | Not Null |

## Tabela PersonagemUsuario

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| PersonagemUsuario | Armazenará a relação entre usuários e personagens jogáveis | Possui chave estrangeira para as tabelas PersonagemJogavel e Usuario |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da relação | int |  | PK |
| nomeUsuario | Nome de usuário | varchar |  | FK, Not Null |
| idPersonagemJogavel | Identificador do personagem jogável | integer |  | FK, Not Null |

## Tabela Tabela Non Player Character

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Non Player Character (NPC) | Armazenará os dados de um personagem não jogável, que podem ser inimigos ou não | Possui chave estrangeira para a tabela Personagem |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idPersonagem | Identificador do personagem | int |  | PK, FK |
| tipoNpc | Tipo do NPC | enum | ("N", "P", "H") | Not Null |
| eBoss | Indica se o NPC é um boss | boolean |  | Not Null |

## Tabela Instancia Personagem Jogável

| Tabela | Descrição | Observações | 
|:----:|:-----:|:-----:|
| InstanciaPC | Armazenará os dados das instâncias dos Personagens Jogáveis | Possui chave estrangeira para as tabelas PersonagemJogavel e BiomaMundo |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da instância | int |  | PK |
| idPersonagemJogavel | Identificador do personagem jogável associado | int |  | FK |
| idMundo | Identificador do mundo associado | int |  | FK |
| idBioma | Identificador do bioma associado | int |  | FK |
| vidaAtual | Quantidade de pontos de vida atual do personagem jogável | smallint |  | Not Null |
| fomeAtual | Nível de fome atual do personagem jogável | smallint |  | Not Null |
| sanidadeAtual | Nível de sanidade atual do personagem jogável | smallint |  | Not Null |
| modoFantasma | Indica se um personagem está no modo fantasma ou não (morto) | boolean |  | Not Null |
| tamanhoInventario | Indica o tamanho do inventário da instância | smallint |  | Not Null, Default 10 |

## Tabela Instancia Non Player Character

| Tabela | Descrição | Observações | 
|:----:|:-----:|:-----:|
| InstanciaNpc | Armazenará os dados das instâncias dos Personagens não jogáveis | Possui chave estrangeira para as tabelas Npc e BiomaMundo |

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
| durabilidade | Quantidade de durabilidade do equipamento | float |  | Not Null |
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

## Tabela Craft

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Craft | Armazenará os dados das estações de craft | Possui chave estrangeira para as tabelas InstanciaPC e Item |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da receita de craft | int |  | PK |
| idItem | Chave estrangeira para o item a ser produzido pela receita | int |  | FK |
| idEstacaoCraft | Chave estrangeira para a estação de craft associada à receita | int |  | FK |

## Tabela EstacaoCraft

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| EstacaoCraft | Armazenará dados das estações de craft no jogo |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da estação de craft | int |  | PK |
| nome | Nome da estação de craft | varchar | 50 | Not Null |
| descricao | Descrição da estação de craft | varchar | 200 | Not Null |
| localizacao | Localização da estação de craft | varchar | 50 | Not Null |

## Tabela Habilidade

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Habilidade | Armazenará os dados das habilidades dos personagens |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador da habilidade | int |  | PK |
| nome | Nome da habilidade | varchar | 50 | Not Null |
| descricao | Descrição da habilidade | varchar | 200 | Not Null |
| idHabPreReq   | Identificador da habilidade pré-requisito | int |  |  |
| eOfensiva | Habilidade ofensiva (Sim ou Não) | boolean |  | Not Null |
| dano | Valor de dano da habilidade | int |  |  |


## Tabela Item

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Item | Armazenará os dados dos itens no jogo |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do item | int |  | PK |
| itemReceita | Identificador do item que é utilizado como ingrediente em receitas | int |  | Not Null |
| nome | Nome do item | varchar | 50 | Not Null |
| descricao | Descrição do item | varchar |  | Not Null |

## Tabela Dialogo

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Dialogo | Armazenará os dados dos diálogos no jogo |  |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| id | Identificador do diálogo | int |  | PK |
| textoFala | Texto do diálogo | varchar |  | Not Null |
| dialogoVinculo | Vínculo para outro diálogo | int |------ |  |

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
| Receita | Armazenará os dados das receitas de craft | Possui chave estrangeira para a tabela Item |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| itemReceita | Identificador da receita de craft | int |  | PK |
| item1 | Chave estrangeira para o item 1 | int |  | FK |
| item2 | Chave estrangeira para o item 2 | int |  | FK |
| item3 | Chave estrangeira para o item 3 | int |  | FK |
| quantidade1 | Quantidade do item 1 necessário na receita | smallint |  | Not Null |
| quantidade2 | Quantidade do item 2 necessário na receita | smallint |  | Not Null |
| quantidade3 | Quantidade do item 3 necessário na receita | smallint |  | Not Null |

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
| tempoApodrecimento | Tempo até o consumível apodrecer | smallint |  | Not Null |

## Tabela Colocavel

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| Colocavel | Armazenará os dados dos itens colocáveis | Possui chave estrangeira para a tabela Item |

#### Campos

| Nome | Descrição | Tipo de Dado | Tamanho | Restrições de Domínio |
| :------: | :------: | :------: | :------: | :------: |
| idItem | Identificador do item colocável | serial |  | PK, FK |
| tamanho | Tamanho do item colocável | smallint |  | Not Null |
| temColisao | Indica se o item colocável tem colisão | boolean |  | Not Null, Default true |
| durabilidade | Durabilidade do item colocável | smallint |  | |
| eEstacaoCraft | Indica se o item colocável é uma estação de craft | boolean |  | Not Null, Default false |

## Tabela InstanciaColocavel

| Tabela | Descrição | Observações |
|:----:|:-----:|:-----:|
| InstanciaColocavel | Armazenará os dados das instâncias dos itens colocáveis | Possui chave estrangeira para as tabelas Colocavel e BiomaMundo |

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
| idInstanciaPc | Identificador da instância do personagem jogável | int |  | PK, FK |
| quantidade | Quantidade do item no inventário | smallint |  | Not Null |

# Histórico de Versão

| Versão | Data | Descrição | Autor |
| :-----: | :------: | ------- | -------- |
| 1.0 | 02/10/2023 | Criação do Documento | [Levi Queiroz](https://github.com/LeviQ27) |
| 1.1 | 02/10/2023 | Criação das Tabelas | [Levi Queiroz](https://github.com/LeviQ27) [Luis Bruno](https://github.com/lbrunofidelis) [Andre Goretti](https://github.com/AGoretti) [Yago Amin](https://github.com/Yagoas) |
| 1.1 | 02/10/2023 | Atualizando as Tabelas | [Levi Queiroz](https://github.com/LeviQ27) [Luis Bruno](https://github.com/lbrunofidelis) [Andre Goretti](https://github.com/AGoretti) [Yago Amin](https://github.com/Yagoas) |
| 1.2 | 02/10/2023 | Atualizando as Tabelas | [Levi Queiroz](https://github.com/LeviQ27) [Luis Bruno](https://github.com/lbrunofidelis) [Andre Goretti](https://github.com/AGoretti) [Yago Amin](https://github.com/Yagoas) |