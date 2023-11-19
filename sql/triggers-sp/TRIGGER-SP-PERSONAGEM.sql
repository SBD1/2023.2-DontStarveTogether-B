-- Triggers/SP para garantir especialização TOTAL/EXCLUSIVA de Personagem - PersonagemJogavel - Npc

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

