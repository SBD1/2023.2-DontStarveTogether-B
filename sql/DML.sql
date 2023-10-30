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
INSERT INTO TipoMundo (nome, x, y, z) VALUES ('Small', 100, 100, 100),
       ('Medium', 300, 300, 300),
       ('Large', 500, 500, 500),
       ('Huge', 1000, 1000, 1000);

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
INSERT INTO PersonagemJogavel (idComidaFavorita, idPersonagem, sanidade, fome) VALUES (1, 1, 100, 150),
(2, 2, 80, 140),
(3, 3, 120, 160),
(4, 4, 90, 130);

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
INSERT INTO InstanciaNpc (idNpc, idMundo, x, y, z, vidaAtual) VALUES
(1, 1, 10, 20, 30, 90),
(1, 1, 15, 25, 35, 85),
(1, 1, 12, 18, 32, 88),
(1, 1, 11, 22, 34, 92),
(1, 1, 14, 21, 31, 87),
(2, 1, 40, 50, 60, 80),
(2, 1, 45, 55, 63, 82),
(2, 1, 42, 58, 65, 81),
(2, 1, 41, 52, 67, 84),
(2, 1, 44, 51, 69, 83),
(3, 1, 70, 80, 90, 70),
(3, 1, 75, 85, 95, 72),
(3, 2, 72, 88, 97, 71),
(3, 2, 71, 82, 99, 74),
(3, 2, 74, 81, 92, 73),
(4, 2, 10, 110, 120, 1350); -- Criar check para que o HPAtual não seja maior que o Hp total

SELECT * FROM InstanciaNpc;

-- InstanciaPC
INSERT INTO InstanciaPC (idPersonagemJogavel, idMundo, vidaAtual, fomeAtual, sanidadeAtual, modoFantasma, x, y, z) VALUES
    (1, 1, 95, 100, 60, false, 10, 20, 30),
    (2, 1, 20, 80, 15, false, 15, 25, 35),
    (3, 1, 30, 100, 50, true, 12, 18, 32),
    (4, 2, 49, 90, 75, false, 11, 22, 34);

SELECT * FROM InstanciaPC;

-- Alianca
INSERT INTO Alianca (idInstanciaPc, idInstanciaNpc) VALUES (4, 9), (3, 1);

SELECT * FROM Alianca;

-- Itens basicos
INSERT INTO Item (nome, descricao) VALUES
  ('Madeira', 'Um pedaço de madeira normal'),
  ('Pedra', 'Uma pedra comum, pode ser usada para construção'),
  ('Flint', 'Um fragmento de pedra afiada, ótimo para ferramentas'),
  ('Grama', 'Uma grama comum'),
  ('Flor', 'Uma bela flor silvestre'),
  ('Folha', 'Uma folha verde'),
  ('Carvão', 'Carvão de madeira queimada'),
  ('Minério de Ferro', 'Minério de ferro bruto'),
  ('Pena', 'Uma pena de ave'),
  ('Pele de Animal', 'Uma pele de animal selvagem'); -- id 10
  
-- Item Consumiveis
INSERT INTO Item (nome, descricao) VALUES
  ('Cozido de Carne', 'Um prato saboroso de carne de animal'),
  ('Salada de Folhas', 'Uma salada refrescante de folhas verdes'),
  ('Sopa de Pele', 'Uma sopa quentinha feita com pele de animal'); -- id 13

-- Item Equipamentos
INSERT INTO Item (nome, descricao) VALUES
  ('Armadura de Madeira', 'Uma armadura rudimentar feita de tábuas de madeira'),
  ('Lança de Batalha', 'Uma lança afiada e resistente'),
  ('Bastão Apresuntado', 'Um bastão feito de pele de animal'),
  ('Capacete Trabalhado', 'Um capacete resistente feito de ferro e madeira.'),
  ('Bota de Pele', 'Uma bota quente e confortável feita de pele de animal.'); -- id 18

--Item Colocaveis
INSERT INTO Item (nome, descricao) VALUES
  ('Cerca de Madeira', 'Uma cerca simples feita de tábuas de madeira'),
  ('Parede de Pedra', 'Uma parede sólida feita de pedras'),
  ('Tapete', 'Um tapete macio e aconchegante de pele de animal.'),
  ('Mesa de Trabalho', 'Uma mesa de trabalho robusta de madeira e pedra'); -- id 22

SELECT * FROM ITEM;

-- Receitas 1 item
INSERT INTO Receita (itemReceita, item1, quantidade1) VALUES
  (14, 1, 10), -- Armadura de madeira
  (16, 10, 15), -- Bastao apresuntado
	(18, 10, 10), -- Botas de pele
	(19, 1, 3),  -- Cerca de madeira
	(20, 2, 3),  -- Parede de pedra
	(21, 10, 10);  -- tapete

-- Receitas 2 itens
INSERT INTO Receita (itemReceita, item1, item2, quantidade1, quantidade2) VALUES
  (11, 10, 9, 3, 3), -- Cozido de Carne
  (12, 5, 6, 5, 5),  -- Salada de Folhas
  (13, 5, 10, 2, 5), -- Sopa de Pele
  (15, 1, 3, 5, 5),  -- Lanca de batalha
	(22, 1, 2, 10, 10); -- Mesa de trabalho

-- Receitas 3 itens
INSERT INTO Receita (itemReceita, item1, item2, item3, quantidade1, quantidade2, quantidade3) VALUES
  (17, 1, 3, 8, 2, 3, 3); -- Capacete Trabalhado
  
SELECT * FROM Receita;

-- Especialiazações de Items: Equipamento
INSERT INTO Equipamento (idItem, parteCorpo, durabilidade, protecao) VALUES
    (14, 2, 50, 15), -- Armadura de Madeira (Peito)
    (15, 3, 45, 0),  -- Lança de Batalha (mão)
    (16, 3, 30, 0), -- Bastão Apresuntado (Mão)
    (17, 1, 35, 30), -- Capacete Trabalhado (cabeça)
    (18, 4, 40, 15); -- Bota de Pele (pés)

SELECT * FROM Equipamento;

-- EquipamentoPersonagem
INSERT INTO EquipamentoPersonagem (idInstanciaPc, idequipamento, durabilidadeAtual) VALUES
		(1, 1, 20),
		(2, 1, 13),
		(3, 1, 4),
		(1, 2, 40),
		(2, 3, 25),
		(3, 2, 30),
		(1, 5, 10),
		(2, 5, 2);

-- Especializações Itens: Consumivel
INSERT INTO Consumivel (idItem, vida, sanidade, fome, tempoApodrecimento) VALUES 
	  (11, 12, 5, 20, 3),
		(12, 18, 10, 26, 2),
		(13, 22, 18, 31, 1);

SELECT * FROM Consumivel;

-- Colocavel
INSERT INTO Colocavel (idItem, tamanho, temColisao, durabilidade, eEstacaoCraft) VALUES
    (19, 1, true, 4, false),  -- cerca
		(20, 1, true, 6, false),  -- parede de pedra
		(21, 4, false, 3, false), -- Tapete
		(22, 2, true, 3, true); -- Mesa craft
		
SELECT * FROM Colocavel;

-- InstanciaColocavel
INSERT INTO InstanciaColocavel (idColocavel, idMundo, x, y, z, durabilidadeAtual) VALUES
		(2, 1, 20, 21, 1, 6),
		(2, 1, 20, 22, 1, 6),
		(2, 1, 20, 23, 1, 6),
		(2, 1, 21, 23, 1, 6),
		(2, 1, 22, 23, 1, 6),
		(2, 1, 22, 24, 1, 6),
		(2, 1, 22, 25, 1, 6),
		(2, 1, 22, 26, 1, 6),
		(3, 1, 19, 20, 1, 3),
		(4, 1, 20, 20, 1, 3);

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
INSERT INTO Habilidade (idHabPreReq, idItemGerado, nome, descricao, eOfensiva, dano, casting) VALUES 
(NULL, NULL, 'Longevidade da Tocha', 'Aumenta a duração da tocha', false, NULL, 0),
(1, NULL, 'Longevidade da Tocha II', 'Aumenta a duração da tocha (maior que nível 1)', false, NULL, 0),
(2, NULL, 'Longevidade da Tocha III', 'Aumenta a duração da tocha (maior que nível 2)', false, NULL, 0),

(NULL, NULL, 'Lenhador', 'Aumenta a coleta de madeira', false, NULL, 0),
(4, 1, 'Lenhador II', 'Aumenta a coleta de madeira (maior que nível 2)', false, NULL, 0),

(NULL, NULL, 'Estocada', 'Perfura o inimigo', true, 30, 0.5),
(6, NULL, 'Estocada II', 'Perfura o inimigo (mais dano que nível 1)', true, 60, 0.8);

SELECT * FROM HABILIDADE;

COMMIT;

BEGIN TRANSACTION;

-- Alters - p/ resetar os ids
ALTER SEQUENCE TipoMundo_id_seq RESTART WITH 1;
ALTER SEQUENCE Mundo_id_seq RESTART WITH 1;
ALTER SEQUENCE Personagem_id_seq RESTART WITH 1;
ALTER SEQUENCE PersonagemUsuario_id_seq RESTART WITH 1;
ALTER SEQUENCE PersonagemJogavel_id_seq RESTART WITH 1;
ALTER SEQUENCE Npc_id_seq RESTART WITH 1;
ALTER SEQUENCE DialogoPersonagem_id_seq RESTART WITH 1;
ALTER SEQUENCE Dialogo_id_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaNpc_id_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaPC_id_seq RESTART WITH 1;
ALTER SEQUENCE Alianca_id_seq RESTART WITH 1;
ALTER SEQUENCE Item_id_seq RESTART WITH 1;
ALTER SEQUENCE Equipamento_id_seq RESTART WITH 1;
ALTER SEQUENCE EquipamentoPersonagem_id_seq RESTART WITH 1;
ALTER SEQUENCE Colocavel_id_seq RESTART WITH 1;
ALTER SEQUENCE InstanciaColocavel_id_seq RESTART WITH 1;
ALTER SEQUENCE Consumivel_id_seq RESTART WITH 1;
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
DROP TABLE IF EXISTS Mundo CASCADE;
DROP TABLE IF EXISTS TipoMundo CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;

COMMIT;