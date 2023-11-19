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


