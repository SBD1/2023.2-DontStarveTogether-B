-- Criacao: 26/10/2023
-- Autores: Luis Bruno
-- Descrição: Criação dos inserts (DML)
-- Atualizações: 
-- 		- Atualização de acordo com as modificações do DDL
-- 		- Finalização de todos os INSERTS

BEGIN TRANSACTION;

-- Usuario
INSERT INTO Usuario (nomeUsuario, nome, email, senha) VALUES ('lukeskywalker', 'Luke Skywalker', 'luke@gmail.com', 'f0rça'),
('darthvader', 'Darth', 'darth@imperio.com', 'souseupai'),
('fulano123', 'Fulano Silva', 'fulano@gmail.com', 'senha123'),
('carlosroberto', 'Roberto Carlos', 'roberto@gmail.com', 'especialdenatal'),
('joaodasilva', 'João Silva', 'joao@gmail.com', 'senha123');

SELECT * FROM Usuario;

-- TipoMundo
INSERT INTO TipoMundo (nome, quantidadeBiomas) VALUES ('Small', 20),
       ('Medium', 40),
       ('Large', 60),
       ('Huge', 100);
	   
SELECT * FROM TipoMundo;

-- Mundo
INSERT INTO Mundo (idUsuario, tipo, nome, estacao, temEstrada)
VALUES ('lukeskywalker', 1, 'Mundo sem nome', 'Autumn', true),
       ('darthvader', 2, 'World 2', 'Winter', false),
       ('fulano123', 3, 'Gameplay da galera', 'Spring', true),
       ('carlosroberto', 4, 'to sem criatividade', 'Summer', false),
       ('lukeskywalker', 2, 'unnamed world', 'Winter', true),
       ('darthvader', 3, 'terraria > dont starve', 'Spring', false),
       ('fulano123', 4, 'lol > dota', 'Summer', true);
	  
SELECT * FROM Mundo;

-- Bioma (assemelha-se a sala)
INSERT INTO Bioma (nome, descricao) VALUES ('Floresta', 'Uma floresta pacífica e com muitos recursos para explorar'),
('Pantanal', 'Um pantanal perigoso, com várias criaturas hostis'),
('Savana', 'Uma enorme planície com gramado, sem muitos recursos e pouca flora, mas com diversas opções para caça'),
('Deserto', 'Um deserto com recursos locais como cactos e plantas secas, e levemente mais quente e seco que Brasília'),
('Terra rochosa', 'Um ambiente rochoso e com diversas recompensas em minerais, mas com seres no minimo esquisitos'),
('Caverna', 'Uma caverna extremamente hostil, com criaturas e recursos nunca explorados. E muitos cogumelos');

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
(3, 1);

SELECT * FROM BiomaMundo;

-- Personagem
INSERT INTO Personagem (nome, descricao, vida) VALUES ('Wilson', 'Cientista', 150),
('Willow', 'Piromaniaca', 150),
('Wolfgang', 'O bodybuilder', 200),
('Wendy', 'A doidinha', 150),
('Spider', 'Uma aranha malvada', 100),
('Tentáculo', '??', 150),
('Bee', 'Abelha', 100),
('Deerclops', 'O brabo Deerclops', 500),
('Abigail', 'A irmã gêmea da wendy =[', 500);

SELECT * FROM Personagem;

-- PersonagemJogavel
INSERT INTO PersonagemJogavel (idPersonagem, sanidade, fome) VALUES (1, 100, 150),
(2, 80, 140),
(3, 120, 160),
(4, 90, 130);

SELECT * FROM PersonagemJogavel;

-- PersonagemUsuario
INSERT INTO PersonagemUsuario (nomeUsuario, idPersonagemJogavel) VALUES ('fulano123', 1),
('fulano123', 2),
('darthvader', 1),
('darthvader', 2),
('carlosroberto', 1),
('carlosroberto', 2),
('joaodasilva', 3),
('joaodasilva', 4);

SELECT * FROM PersonagemUsuario;

-- Npc
INSERT INTO Npc (idPersonagem, tipoNpc, eBoss) VALUES
(5, 'N', false),
(6, 'P', false),
(7, 'H', false),
(8, 'H', true),
(9, 'P', false);

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
(5, 1, 1, 90),
(5, 1, 1, 85),
(5, 1, 2, 88),
(5, 1, 2, 92),
(6, 1, 3, 87),
(6, 1, 4, 80),
(7, 1, 5, 82),
(7, 1, 6, 81),
(7, 1, 3, 84),
(7, 1, 3, 83),
(7, 1, 4, 70),
(7, 1, 5, 72),
(5, 2, 1, 71),
(5, 2, 1, 74),
(9, 2, 2, 73),
(8, 2, 2, 1350); -- Criar check para que o HPAtual não seja maior que o Hp total

SELECT * FROM InstanciaNpc;

-- InstanciaPC
INSERT INTO InstanciaPC (idPersonagemJogavel, idMundo, idBioma, vidaAtual, fomeAtual, sanidadeAtual, modoFantasma) VALUES
    (1, 1, 1, 95, 100, 60, false),
    (2, 1, 1, 20, 80, 15, false),
    (3, 1, 2, 30, 100, 50, true),
    (4, 2, 2, 49, 90, 75, false);

SELECT * FROM InstanciaPC;

-- Alianca
INSERT INTO Alianca (idInstanciaPc, idInstanciaNpc) VALUES (4, 9), (3, 1);

SELECT * FROM Alianca;

-- Itens basicos (ids 1 a 15)
INSERT INTO Item (nome, descricao) VALUES
  ('Madeira', 'Um pedaço de madeira normal'),
  ('Pedra', 'Uma pedra comum, pode ser usada para construção'),
  ('Flint', 'Um fragmento de pedra afiada, ótimo para ferramentas'),
  ('Grama', 'Uma grama comum'),
  ('Graveto', 'Um pequeno graveto'),
  ('Folha', 'Uma folha verde'),
  ('Carvão', 'Carvão de madeira queimada'),
  ('Minério de Ferro', 'Minério de ferro bruto'),
  ('Ouro', 'Um pequena e valiosa pedra de ouro, utilizado para criações especiais'),
  ('Pena', 'Uma pena de ave'),
  ('Pele de Animal', 'Uma pele de animal selvagem'),
  ('Flor', 'Uma flor de onde as abelhas costumam passar um tempo'),
  ('Cobre', 'Um pequeno pedaço de cobre'),
  ('Fio de cobre', 'Um pequeno e fino pedaço de fio de cobre, utilizado para energia elétrica'),
  ('Corda', 'Um pedaço de corda utilizado em criações especiais.'); --id 15
  
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
INSERT INTO Colocavel (idItem, tamanho, temColisao, durabilidade, eEstacaoCraft) VALUES
    (21, 1, true, 4, false),  -- cerca
		(22, 1, true, 6, false),  -- parede de pedra
		(23, 4, false, 3, false), -- Tapete
		(24, 2, true, 3, true); -- Mesa craft
		
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
	
	(1, 2, 18),
	(2, 2, 14),
	(7, 2, 5),
	(8, 2, 3),
	(13, 2, 3),
	(14, 2, 3),
	
	(19, 3, 20),
	(20, 3, 19),
	(1, 3, 30),
	(2, 3, 33);
	
SELECT * FROM Inventario;

-- Habilidade
INSERT INTO Habilidade (idHabPreReq, nome, descricao, eOfensiva, dano) VALUES 
(NULL, 'Longevidade da Tocha', 'Aumenta a duração da tocha', false, NULL),
(1, 'Longevidade da Tocha II', 'Aumenta a duração da tocha (maior que nível 1)', false, NULL),
(2, 'Longevidade da Tocha III', 'Aumenta a duração da tocha (maior que nível 2)', false, NULL),
(NULL, 'Estocada', 'Perfura o inimigo', true, 30),
(4, 'Estocada II', 'Perfura o inimigo (mais dano que nível 1)', true, 60);

SELECT * FROM HABILIDADE;

COMMIT;

BEGIN TRANSACTION;

-- Alters - p/ resetar os ids
ALTER SEQUENCE tipomundo_id_seq RESTART WITH 1;
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
ALTER SEQUENCE Equipamento_idItem_seq RESTART WITH 1;
ALTER SEQUENCE EquipamentoPersonagem_id_seq RESTART WITH 1;
ALTER SEQUENCE Colocavel_idItem_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaColocavel_id_seq RESTART WITH 1;
ALTER SEQUENCE Consumivel_idItem_seq RESTART WITH 1;
ALTER SEQUENCE Habilidade_id_seq RESTART WITH 1;

-- Drops
DROP TABLE IF EXISTS Inventario CASCADE;
DROP TABLE IF EXISTS Consumivel CASCADE;
DROP TABLE IF EXISTS InstanciaColocavel CASCADE;
DROP TABLE IF EXISTS Colocavel CASCADE;
DROP TABLE IF EXISTS EquipamentoPersonagem CASCADE;
DROP TABLE IF EXISTS Equipamento CASCADE;
DROP TABLE IF EXISTS Item CASCADE;
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
DROP TABLE IF EXISTS TipoMundo CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;

COMMIT;