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

-- Triggers de exclusão de registros correspondentes nas tabela genérica Personagem e específicas PersonagemJogavel/Npc
CREATE OR REPLACE FUNCTION excluirPersonagemEspecifico()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM PersonagemJogavel WHERE idPersonagem = OLD.id;
    DELETE FROM Npc WHERE idPersonagem = OLD.id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_excluirPersonagemEspecifico
BEFORE DELETE ON Personagem
FOR EACH ROW
EXECUTE PROCEDURE excluirPersonagemEspecifico();

CREATE OR REPLACE FUNCTION excluirPersonagemGenerico()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM Personagem WHERE id = OLD.idPersonagem;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_excluirPersonagemAoExcluirPc
AFTER DELETE ON PersonagemJogavel
FOR EACH ROW
EXECUTE PROCEDURE excluirPersonagemGenerico();

CREATE TRIGGER t_excluirPersonagemAoExcluirNpc
AFTER DELETE ON Npc
FOR EACH ROW
EXECUTE PROCEDURE excluirPersonagemGenerico();

CREATE OR REPLACE FUNCTION inserirPersonagemEspecializado()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.sanidade IS NOT NULL AND NEW.fome IS NOT NULL THEN
        INSERT INTO PersonagemJogavel (idPersonagem, sanidade, fome)
        VALUES (NEW.id, NEW.sanidade, NEW.fome);
    ELSIF NEW.tipoNpc IS NOT NULL AND NEW.eBoss IS NOT NULL THEN
        INSERT INTO Npc (idPersonagem, tipoNpc, eBoss)
        VALUES (NEW.id, NEW.tipoNpc, NEW.eBoss);
    ELSE
		    DELETE FROM Personagem WHERE id = NEW.id;
        RAISE EXCEPTION 'Tipo de Personagem não reconhecido';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_inserirPersonagemEspecializado
AFTER INSERT ON Personagem
FOR EACH ROW
EXECUTE PROCEDURE inserirPersonagemEspecializado();
