-- Criacao: 26/10/2023
-- Autores: Luis Bruno
-- Descrição: Criação dos inserts (DML)
-- ROLLBACK
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
INSERT INTO InstanciaNpc (idNpc, x, y, z, vidaAtual) VALUES
(1, 10, 20, 30, 90),
(1, 15, 25, 35, 85),
(1, 12, 18, 32, 88),
(1, 11, 22, 34, 92),
(1, 14, 21, 31, 87),
(2, 40, 50, 60, 80),
(2, 45, 55, 63, 82),
(2, 42, 58, 65, 81),
(2, 41, 52, 67, 84),
(2, 44, 51, 69, 83),
(3, 70, 80, 90, 70),
(3, 75, 85, 95, 72),
(3, 72, 88, 97, 71),
(3, 71, 82, 99, 74),
(3, 74, 81, 92, 73),
(4, 10, 110, 120, 1350); -- Criar check para que o HPAtual não seja maior que o Hp total

SELECT * FROM InstanciaNpc;

-- InstanciaPC
INSERT INTO InstanciaPC (idPersonagemJogavel, vidaAtual, fomeAtual, sanidadeAtual, modoFantasma, x, y, z) VALUES
    (1, 95, 100, 60, false, 10, 20, 30),
    (2, 20, 80, 15, false, 15, 25, 35),
    (3, 30, 100, 50, true, 12, 18, 32),
    (4, 49, 90, 75, false, 11, 22, 34);

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
  ('Pele de Animal', 'Uma pele de animal selvagem');

-- Consumiveis 
INSERT INTO Item (nome, descricao, referenciaItem)
VALUES
  ('Cozido de Carne', 'Um prato saboroso feito com carne de animal', NULL),
  ('Salada de Folhas', 'Uma salada refrescante de folhas verdes', NULL),
  ('Sopa de Pele', 'Uma sopa quentinha e nutritiva feita com pele de animal', NULL);

SELECT * FROM ITEM;

-- Receita - 1 item

COMMIT;

-- ROLLBACK

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
ALTER SEQUENCE Equipamento_id_seq RESTART WITH 1;
ALTER SEQUENCE EquipamentoPersonagem_id_seq RESTART WITH 1;
ALTER SEQUENCE Colocavel_id_seq RESTART WITH 1;
ALTER SEQUENCE Consumivel_id_seq RESTART WITH 1;
ALTER SEQUENCE Inventario_id_seq RESTART WITH 1;

-- Drops
DROP TABLE IF EXISTS Inventario CASCADE;
DROP TABLE IF EXISTS Consumivel CASCADE;
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
