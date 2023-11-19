-- buscar triggers
SELECT  event_object_table AS table_name, trigger_name          
FROM information_schema.triggers  
GROUP BY table_name, trigger_name  
ORDER BY table_name, trigger_name  

-- busca triggers de uma tabela
SELECT  event_object_table AS table_name, trigger_name         
FROM information_schema.triggers  
WHERE event_object_table = 'Inventario' 
GROUP BY table_name, trigger_name 
ORDER BY table_name, trigger_name

-- Trigger que verifica se há espaço na mochila antes de inserir
CREATE OR REPLACE FUNCTION atualiza_inventario() RETURNS TRIGGER
AS
$$
DECLARE
	tamanho SMALLINT; -- Tamanho do inventario da instancia jogável
	quantidade_de_itens SMALLINT; -- Quantidade de itens na mochila da instancia
BEGIN
	SELECT tamanhoInventario from InstanciaPC WHERE id = NEW.idInstanciaPc INTO tamanho;
	SELECT COUNT(*) FROM Inventario WHERE idInstanciaPc = NEW.idInstanciaPc INTO quantidade_de_itens;
	IF tamanho < quantidade_de_itens + 1 THEN
		RAISE EXCEPTION 'Sua mochila está cheia!';
	END IF;
	
	RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_atualiza_inventario
BEFORE INSERT ON Inventario
FOR EACH ROW
EXECUTE PROCEDURE atualiza_inventario();

-- Triggers/SP para garantir especialização Personagem - PersonagemJogavel - Npc
CREATE OR REPLACE FUNCTION verificarPersonagemJogavel()
RETURNS TRIGGER AS $$
BEGIN
	IF EXISTS (SELECT 1 FROM Npc WHERE idPersonagem = NEW.idPersonagem) THEN
        RAISE EXCEPTION 'Personagem já é um Npc';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_verificarPersonagemJogavel
BEFORE INSERT ON PersonagemJogavel
FOR EACH ROW
EXECUTE PROCEDURE verificarPersonagemJogavel();

CREATE OR REPLACE FUNCTION verificarNpc()
RETURNS TRIGGER AS $$
BEGIN
	IF EXISTS (SELECT 1 FROM PersonagemJogavel WHERE idPersonagem = NEW.idPersonagem) THEN
		RAISE EXCEPTION 'Npc já é um personagem jogável';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_verificarNpc
BEFORE INSERT ON Npc
FOR EACH ROW
EXECUTE PROCEDURE verificarNpc();

-- Teste das TRIGGERS e Stored Procedure 
INSERT INTO PersonagemJogavel (idPersonagem, sanidade, fome) VALUES (5, 50, 50);
INSERT INTO Npc (idPersonagem, eBoss, tipoNpc) VALUES (3, true, 'N');


-- Triggers e Stored procedures p/ especialização de itens
-- Consumivel
CREATE OR REPLACE FUNCTION verificarConsumivel()
RETURNS TRIGGER AS $$
DECLARE 
	tabela_contendo_item VARCHAR;
BEGIN
	IF EXISTS (SELECT 1 FROM Equipamento WHERE idItem = NEW.idItem) 
		THEN tabela_contendo_item := 'Equipamento';
	ELSIF EXISTS (SELECT 1 FROM Colocavel WHERE idItem = NEW.idItem) 
		THEN tabela_contendo_item := 'Colocavel';
	ELSE 
		tabela_contendo_item := NULL;
	END IF;
	
	IF tabela_contendo_item IS NOT NULL THEN
		RAISE EXCEPTION 'Item já existe na tabela %', tabela_contendo_item;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_verificarConsumivel 
BEFORE INSERT ON Consumivel
FOR EACH ROW
EXECUTE PROCEDURE verificarConsumivel();

-- Testes das triggers/sp de Consumivel:
INSERT INTO Consumivel (idItem, vida, sanidade, fome, tempoApodrecimento) VALUES (22, 12, 5, 20, 3);
INSERT INTO Consumivel (idItem, vida, sanidade, fome, tempoApodrecimento) VALUES (18, 12, 5, 20, 3);

-- Equipamento
CREATE OR REPLACE FUNCTION verificarEquipamento()
RETURNS TRIGGER AS $$
DECLARE 
	tabela_contendo_item VARCHAR;
BEGIN
	IF EXISTS (SELECT 1 FROM Consumivel WHERE idItem = NEW.idItem) 
		THEN tabela_contendo_item := 'Consumivel';
	ELSIF EXISTS (SELECT 1 FROM Colocavel WHERE idItem = NEW.idItem) 
		THEN tabela_contendo_item := 'Colocavel';
	ELSE 
		tabela_contendo_item := NULL;
	END IF;
	
	IF tabela_contendo_item IS NOT NULL THEN
		RAISE EXCEPTION 'Item já existe na tabela %', tabela_contendo_item;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_verificarEquipamento
BEFORE INSERT ON Equipamento
FOR EACH ROW
EXECUTE PROCEDURE verificarEquipamento();

-- Testes das triggers/sp de Equipamento:
INSERT INTO Equipamento (idItem, parteCorpo, durabilidade, protecao, aumentaInventario) VALUES (22, 2, 50, 15, 0);
INSERT INTO Equipamento (idItem, parteCorpo, durabilidade, protecao, aumentaInventario) VALUES (13, 2, 50, 15, 0);

-- Colocavel
CREATE OR REPLACE FUNCTION verificarColocavel()
RETURNS TRIGGER AS $$
DECLARE 
	tabela_contendo_item VARCHAR;
BEGIN
	IF EXISTS (SELECT 1 FROM Consumivel WHERE idItem = NEW.idItem) 
		THEN tabela_contendo_item := 'Consumivel';
	ELSIF EXISTS (SELECT 1 FROM Equipamento WHERE idItem = NEW.idItem) 
		THEN tabela_contendo_item := 'Equipamento';
	ELSE 
		tabela_contendo_item := NULL;
	END IF;
	
	IF tabela_contendo_item IS NOT NULL THEN
		RAISE EXCEPTION 'Item já existe na tabela %', tabela_contendo_item;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_verificarColocavel
BEFORE INSERT ON Colocavel
FOR EACH ROW
EXECUTE PROCEDURE verificarColocavel();

-- Testes das triggers/sp de Colocavel:
INSERT INTO Colocavel (idItem, tamanho, temColisao, durabilidade, eEstacaoCraft) VALUES (12, 1, true, 4, false);
INSERT INTO Colocavel (idItem, tamanho, temColisao, durabilidade, eEstacaoCraft) VALUES (18, 1, true, 4, false);
