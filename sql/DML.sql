BEGIN TRANSACTION;

-- Usuario
INSERT INTO Usuario (nomeUsuario, nome, email, senha) VALUES ('lukeskywalker', 'Luke Skywalker', 'luke@gmail.com', 'f0rça'),
('darthvader', 'Darth', 'darth@imperio.com', 'souseupai'),
('fulano123', 'Fulano Silva', 'fulano@gmail.com', 'senha123'),
('carlosroberto', 'Roberto Carlos', 'roberto@gmail.com', 'especialdenatal'),
('mauserrbr', 'Mauricio Serrano', 'mauserrbr@gmail.com', 'serranomauricioprof'),
('teste', 'Usuário Teste', 'teste@gmail.com', '123');

SELECT * FROM Usuario;

-- Mundo
INSERT INTO Mundo (idUsuario, nome, estacao)
VALUES ('teste', 'Mundo sem nome', 'Autumn'),
       ('mauserrbr', 'World 2', 'Winter'),
       ('fulano123', 'Gameplay da galera', 'Spring'),
       ('carlosroberto', 'to sem criatividade', 'Summer'),
       ('lukeskywalker', 'unnamed world', 'Winter'),
       ('darthvader', 'terraria > dont starve', 'Spring'),
       ('fulano123', 'lol > dota', 'Summer');
	  
SELECT * FROM Mundo;

-- Bioma (assemelha-se a sala)
INSERT INTO Bioma (nome, descricao) VALUES ('Floresta', 'Uma floresta pacífica e com muitos recursos para explorar'),
('Pantanal', 'Um pantanal perigoso, com várias criaturas hostis'),
('Savana', 'Uma enorme planície com gramado, sem muitos recursos e pouca flora, mas com diversas opções para caça'),
('Deserto', 'Um deserto com recursos locais como cactos e plantas secas, e levemente mais quente e seco que Brasília'),
('Terra rochosa', 'Um ambiente rochoso e com diversas recompensas em minerais, mas com seres no minimo esquisitos'),
('Caverna', 'Uma caverna extremamente hostil, com criaturas e recursos nunca explorados');

SELECT * FROM Bioma;

-- Biomamundo
INSERT INTO BiomaMundo (idMundo, idBioma) VALUES (1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 4);

SELECT * FROM BiomaMundo;

-- Personagem
INSERT INTO Personagem (nome, descricao, vida, dano) VALUES 
('Wilson', 'Cientista', 180, 30),  -- id 1
('Willow', 'Piromaniaca', 180, 30),  -- id 2
('Wolfgang', 'O bodybuilder', 200, 40),  -- id 3
('Wendy', 'A doidinha', 150, 20),  -- id 4
('Spider', 'Uma aranha malvada', 100, 30),  -- id 5
('Tentáculo', '??', 150, 30),  -- id 6
('Bee', 'Abelha', 30, 10),  -- id 7
('Deerclops', 'O brabo Deerclops', 500, 50),  -- id 8
('Abigail', 'A falecida irmã gêmea da wendy', 500, 25),  -- id 9
('Pássaro', 'Um pássaro inofensivo', 20, 0),  -- id 10
('Coelho', 'Um coelho inofensivo', 20, 0),  -- id 11
('Toupeira', 'Uma toupeira inofensivo', 20, 0);  -- id 12

SELECT * FROM Personagem;

-- PersonagemJogavel
INSERT INTO PersonagemJogavel (idPersonagem, sanidade, fome) VALUES 
(1, 100, 100),  -- Wilson
(2, 100, 100),  -- Willow
(3, 100, 90),  -- Wolfgang
(4, 90, 100);  -- Wendy

SELECT * FROM PersonagemJogavel;

-- PersonagemUsuario
INSERT INTO PersonagemUsuario (nomeUsuario, idPersonagemJogavel) VALUES 
('teste', 3),
('teste', 4),
('mauserrbr', 3),
('mauserrbr', 1);

SELECT * FROM PersonagemUsuario;

-- Itens basicos (ids 1 a 15)
INSERT INTO Item (nome, descricao) VALUES
  ('Madeira', 'Um pedaço de madeira normal'),  -- 1
  ('Pedra', 'Uma pedra comum, pode ser usada para construção'), -- 3
  ('Flint', 'Um fragmento de pedra afiada, ótimo para ferramentas'),  -- 4
  ('Grama', 'Uma grama comum'),  -- 5
  ('Graveto', 'Um pequeno graveto'),   -- 6
  ('Folha', 'Uma folha verde'),     -- 7
  ('Carvão', 'Carvão de madeira queimada'),   -- 8
  ('Minério de Ferro', 'Minério de ferro bruto'),
  ('Ouro', 'Um pequena e valiosa pedra de ouro, utilizado para criações especiais'),   -- 9
  ('Pena', 'Uma pena de ave'),   -- 10
  ('Pele de Animal', 'Uma pele de animal selvagem'),   -- 11
  ('Flor', 'Uma flor de onde as abelhas costumam passar um tempo'),   -- 12
  ('Cobre', 'Um pequeno pedaço de cobre'),   -- 13
  ('Fio de cobre', 'Um pequeno e fino pedaço de fio de cobre, utilizado para energia elétrica'),   -- 14
  ('Corda', 'Um pedaço de corda utilizado em criações especiais.'); --id 15


INSERT INTO InstanciaItem (idItem, idMundo, idBioma) VALUES
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(2, 1, 1),
(2, 1, 1),
(2, 1, 1),
(2, 1, 1),
(2, 1, 1),
(3, 1, 1),
(3, 1, 1),
(3, 1, 1),
(3, 1, 1),
(3, 1, 1),
(4, 1, 1),
(4, 1, 1),
(4, 1, 1),
(4, 1, 1),
(4, 1, 1),
(5, 1, 1),
(5, 1, 1),
(5, 1, 1),
(5, 1, 1),
(5, 1, 1),
(9, 1, 1),
(9, 1, 1),
(9, 1, 1);

SELECT * FROM InstanciaItem;

-- Npc
INSERT INTO Npc (idPersonagem, itemDropado, tipoNpc, eBoss) VALUES
(5, NULL, 'H', false),  -- Spider
(6, NULL, 'H', false),  -- Tentáculo
(7, NULL, 'N', false),  -- Bee
(8, NULL, 'H', true),  -- Deerclops
(9, NULL, 'N', false), -- Abigail
(10, NULL, 'P', false), -- Pássaro
(11, NULL, 'P', false), -- Coelho
(12, NULL, 'P', false); -- Toupeira

SELECT * FROM Npc;

-- Dialogo
INSERT INTO Dialogo (textoFala, dialogoVinculo) VALUES
('Está na hora de acender o fogo', NULL),
('Adoro quando as chamas dançam', 1),
('A escuridão nos consome', NULL),
('Wolfgang esmaga!!!', NULL),
('Sssss...', NULL),
('zzzZZzZz', 6),
('Preparem-se, mortais!', NULL),
('Deerclops! Ele está aqui!', NULL),
('Um gigante das neves!!', 8),
('Nossa, ele é grande!', 9),
('Wolfgang enfrentará o monstro, VEM MONXTRO!!', 4),
('Medo..', NULL),
('Ele está perto!!', NULL),
('Fuja do Deerclops!', NULL);

SELECT * FROM Dialogo;

-- DialogoPersonagem
INSERT INTO DialogoPersonagem (idPersonagem, idDialogo)
VALUES (1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(7, 5),
(7, 6),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(3, 4),
(8, 7);

SELECT * FROM DialogoPersonagem;

-- InstanciaNpc
INSERT INTO InstanciaNpc (idNpc, idMundo, idBioma, vidaAtual) VALUES
(10, 1, 1, 20),
(11, 1, 1, 20),
(12, 1, 1, 20),
(5, 1, 2, 50),
(6, 1, 3, 50),
(7, 1, 4, 20),
(7, 1, 4, 20),
(7, 1, 4, 20); -- Criar check para que o HPAtual não seja maior que o Hp total

SELECT * FROM InstanciaNpc;

-- InstanciaPC
INSERT INTO InstanciaPC (idPersonagemJogavel, idMundo, idBioma, vidaAtual, fomeAtual, sanidadeAtual, modoFantasma) VALUES
    (3, 1, 1, 100, 90, 100, false),
    (3, 2, 1, 100, 90, 100, false);

SELECT * FROM InstanciaPC;

-- Alianca
-- INSERT INTO Alianca (idInstanciaPc, idInstanciaNpc) VALUES (1, 9), (3, 1);  -- Criar trigger p/ quando instanciar uma Wendy deve instanciar Abigail

-- SELECT * FROM Alianca;

  
-- Item Consumiveis (ids 16 a 25)
INSERT INTO Item (nome, descricao) VALUES
  ('Misto de frutas', 'Uma boa quantidade frutas genéricas frescas'),
  ('Coelho morto', 'Um coelho abatido fresco, pronto para preparo'),
  ('Coelho assado', 'Um coelho quentinho assado na brasa'),
  ('Toupeira morta', 'Uma toupeira abatida, pronta para preparo'),
  ('Toupeira assada', 'Uma toupeira quentinha assada na brasa'),
  ('Ave morta', 'Uma ave abatida, pronta para preparo'),
  ('Ave assada', 'Uma ave quentinha assada na brasa'),
  ('Cozido de Carnes', 'Um prato saboroso de carne de animal'),
  ('Salada de Folhas', 'Uma salada refrescante de folhas verdes'),
  ('Sopa de Pele', 'Uma sopa quentinha feita com pele de animal'); -- id 25

-- Item Equipamentos (ids 26 a 35)
INSERT INTO Item (nome, descricao) VALUES
  ('Machado', 'Um machado simples, mas que funciona muito bem'),
  ('Picareta', 'Uma picareta simples, mas que funciona muito bem'),
  ('Espada', 'Uma espada simples, mas que funciona muito bem'),
  ('Armadura de Madeira', 'Uma armadura rudimentar feita de tábuas de madeira'),
  ('Lança de Batalha', 'Uma lança afiada e resistente'),
  ('Bastão Apresuntado', 'Um bastão feito de carne de animal'),
  ('Capacete Trabalhado', 'Um capacete resistente feito de ferro e madeira.'),
  ('Bota de Pele', 'Uma bota quente e confortável feita de pele de animal.'),
  ('Mochila pequena', 'Uma mochila que adiciona 5 espaços no seu inventário.'),
  ('Tocha', 'Uma tocha para iluminar suas noites escuras'); -- id 35

--Item Colocaveis (36 a 40)
INSERT INTO Item (nome, descricao) VALUES
  ('Fogueira', 'Uma fogueira acochegante, muito útil para noites frias e escuras'),
  ('Cerca de Madeira', 'Uma cerca simples feita de tábuas de madeira'),
  ('Tapete', 'Um tapete macio e aconchegante de pele de animal.'),
  ('Panela velha', '"Panela velha é a que faz comida boa"'),
  ('Mesa de Trabalho', 'Uma mesa de trabalho robusta de madeira e pedra'); -- id 40

SELECT * FROM ITEM;

-- Receitas 1 item
INSERT INTO Receita (itemReceita, estacaoCraft, item1, quantidade1) VALUES
  (15, NULL, 4, 3),  -- Corda (3x gramas) - sem estação
  (16, NULL, 11, 15), -- Bastao apresuntado (12x pele de animal) - sem estação
  (18, 36, 17, 1),  -- Coelho assado (1x coelho morto) - fogueira
  (20, 36, 19, 1),  -- Toupeira assada (1x toupeira morta) - fogueira
  (21, 40, 11, 5),  -- tapete (10x pele de animal) - mesa de trabalho
  (22, 36, 21, 1),  -- Ave assada (1x ave morta) - fogueira
  (29, 40, 1, 10), -- Armadura de madeira (10x madeira) - mesa de trabalho
  (33, NULL, 11, 8); -- Botas de pele (8x pele de animal) - sem estação

-- Receitas 2 itens
INSERT INTO Receita (itemReceita, estacaoCraft, item1, item2, quantidade1, quantidade2) VALUES
  (23, 39, 17, 19, 1, 1), -- Cozido de Carnes (1x toupeira morta, 1x coelho morto) - Panela velha
  (24, 39, 6, 12, 2, 3),  -- Salada de Folhas (2x folha, 3x flor) - Panela velha
  (25, 39, 17, 25, 1, 1), -- Sopa de Pele (1x coelho morto, 1x pele de animal) - panela velha
  (30, 40, 5, 8, 5, 3),  -- Lanca de batalha (5x gravetos, 3x minério de ferro) - mesa de trabalho
	(40, NULL, 1, 9, 8, 2), -- Mesa de trabalho (5x madeira, 2x minério de ferro) - sem estação
  (39, 40, 8, 7, 2, 5); -- Mesa de trabalho (2x minério de ferro, 5x carvão) - mesa de trabalho

-- Receitas 3 itens
INSERT INTO Receita (itemReceita, estacaoCraft, item1, item2, item3, quantidade1, quantidade2, quantidade3) VALUES
  (32, 40, 3, 8, 9, 5, 3, 1); -- Capacete Trabalhado (5x flint, 3x minério de ferro, 1x ouro) - mesa de trabalho
  
SELECT * FROM Receita;

-- Especialiazações de Items: Equipamento
INSERT INTO Equipamento (idItem, parteCorpo, durabilidade, protecao, ataque, aumentaInventario) VALUES
    (26, 3, 80, 0, 10, 0), -- Machado (mão)
    (27, 3, 80, 0, 10, 0),  -- Picareta (mão)
    (28, 3, 80, 0, 20, 0), -- Espada (Mão)
    (29, 2, 100, 20, 0, 0), -- Armadura de madeira (peito)
    (30, 3, 100, 0, 40, 0),  -- Lança de batalha (mão)
    (31, 3, 100, 0, 30, 0),  -- Bastão Apresuntado (mão)
    (32, 1, 100, 30, 10, 0),  -- Capacete trabalhado (cabeça)
    (33, 4, 100, 15, 0, 0),  -- Botas de pele (pés)
    (34, 2, 100, 0, 0, 5),  -- Mochila (peito)
    (35, 3, 100, 0, 0, 0);  -- Tocha (mão)

SELECT * FROM Equipamento;

-- EquipamentoPersonagem
INSERT INTO EquipamentoPersonagem (idInstanciaPc, idequipamento, durabilidadeAtual) VALUES
		(1, 14, 20),
		(2, 15, 13),
		(3, 16, 4),
		(1, 17, 40),
		(2, 18, 25),
		(3, 19, 30),
		(1, 20, 10),
		(2, 14, 2);

SELECT * FROM EquipamentoPersonagem;

-- Especializações Itens: Consumivel -- Criar instancia consumivel e adicionar coluna tempo (em dias)
INSERT INTO Consumivel (idItem, vida, sanidade, fome, tempoApodrecimento) VALUES 
	  (11, 12, 5, 20, 3),
		(12, 18, 10, 26, 2),
		(13, 22, 18, 31, 1);

SELECT * FROM Consumivel;

-- Colocavel
INSERT INTO Colocavel (idItem, durabilidade, eEstacaoCraft) VALUES
    (21, 1, false),  -- cerca
		(22, 6, false),  -- parede de pedra
		(23, 3, false), -- Tapete
		(24, 3, true); -- Mesa craft
		
SELECT * FROM Colocavel;

-- InstanciaColocavel
INSERT INTO InstanciaColocavel (idColocavel, idMundo, idBioma, durabilidadeAtual) VALUES
		(21, 1, 1, 6),
		(21, 1, 1, 6),
		(21, 1, 1, 6),
		(21, 1, 1, 6),
		(21, 1, 2, 6),
		(21, 1, 2, 6),
		(21, 1, 2, 6),
		(21, 1, 2, 6),
		(22, 1, 2, 3),
		(23, 1, 2, 3),
		(24, 1, 3, 6);

SELECT * FROM InstanciaColocavel;

-- Inventario
INSERT INTO Inventario (idItem, idInstanciaPc, quantidade) VALUES 
	(1, 1, 10),
	(2, 1, 12),
	(3, 1, 4),
	(4, 1, 3),
	(5, 1, 1),
	(6, 1, 5),
	(7, 1, 2),
	(8, 1, 2),
	(9, 1, 2),
	(10, 1, 5);
	
SELECT * FROM Inventario;

-- Habilidade
INSERT INTO Habilidade (idHabPreReq, nome, descricao, dano) VALUES 
(NULL, 'Longevidade da Tocha', 'Aumenta a duração da tocha', 0),
(1, 'Longevidade da Tocha II', 'Aumenta a duração da tocha (maior que nível 1)', 0),
(2, 'Longevidade da Tocha III', 'Aumenta a duração da tocha (maior que nível 2)', 0),
(NULL, 'Estocada', 'Perfura o inimigo', 50),
(4, 'Estocada II', 'Perfura o inimigo (mais dano que nível 1)', 65);

SELECT * FROM HABILIDADE;

COMMIT;

BEGIN TRANSACTION;

-- Alters - p/ resetar os ids
ALTER SEQUENCE Mundo_id_seq RESTART WITH 1;
ALTER SEQUENCE Bioma_id_seq RESTART WITH 1;
ALTER SEQUENCE Personagem_id_seq RESTART WITH 1;
ALTER SEQUENCE PersonagemUsuario_id_seq RESTART WITH 1;
ALTER SEQUENCE PersonagemJogavel_idPersonagem_seq RESTART WITH 1;
ALTER SEQUENCE Npc_idPersonagem_seq RESTART WITH 1;
ALTER SEQUENCE DialogoPersonagem_id_seq RESTART WITH 1;
ALTER SEQUENCE Dialogo_id_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaNpc_id_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaPC_id_seq RESTART WITH 1;
ALTER SEQUENCE Alianca_id_seq RESTART WITH 1;
ALTER SEQUENCE Item_id_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaItem_id_seq RESTART WITH 1;
ALTER SEQUENCE Equipamento_idItem_seq RESTART WITH 1;
ALTER SEQUENCE EquipamentoPersonagem_id_seq RESTART WITH 1;
ALTER SEQUENCE Colocavel_idItem_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaColocavel_id_seq RESTART WITH 1;
ALTER SEQUENCE Consumivel_idItem_seq RESTART WITH 1;
ALTER SEQUENCE Habilidade_id_seq RESTART WITH 1;
-- ALTER SEQUENCE HabilidadePersonagem_id_seq RESTART WITH 1;

-- Drops
DROP TABLE IF EXISTS Inventario CASCADE;
DROP TABLE IF EXISTS Consumivel CASCADE;
DROP TABLE IF EXISTS InstanciaColocavel CASCADE;
DROP TABLE IF EXISTS Colocavel CASCADE;
DROP TABLE IF EXISTS EquipamentoPersonagem CASCADE;
DROP TABLE IF EXISTS Equipamento CASCADE;
DROP TABLE IF EXISTS InstanciaItem CASCADE;
DROP TABLE IF EXISTS Item CASCADE;
DROP TABLE IF EXISTS HabilidadePersonagem CASCADE;
DROP TABLE IF EXISTS Habilidade CASCADE;
DROP TABLE IF EXISTS Receita CASCADE;
DROP TABLE IF EXISTS Item CASCADE;
DROP TABLE IF EXISTS Alianca CASCADE;
DROP TABLE IF EXISTS InstanciaPC CASCADE;
DROP TABLE IF EXISTS InstanciaNpc CASCADE;
DROP TABLE IF EXISTS Dialogo CASCADE;
DROP TABLE IF EXISTS DialogoPersonagem CASCADE;
DROP TABLE IF EXISTS Npc CASCADE;
DROP TABLE IF EXISTS PersonagemJogavel CASCADE;
DROP TABLE IF EXISTS PersonagemUsuario CASCADE;
DROP TABLE IF EXISTS Personagem CASCADE;
DROP TABLE IF EXISTS BiomaMundo CASCADE;
DROP TABLE IF EXISTS Bioma CASCADE;
DROP TABLE IF EXISTS Mundo CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;

COMMIT;