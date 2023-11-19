-- Triggers e Stored Procedures p/ garantir especialização/generalização de itens (PARCIAL EXCLUSIVA)

-- Triggers e Stored procedures p/ exclusividade de itens (Consumivel OU Equipamento OU Colocavel)
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
