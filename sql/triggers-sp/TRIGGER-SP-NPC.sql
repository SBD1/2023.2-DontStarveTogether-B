CREATE OR REPLACE FUNCTION verifica_npc_morto()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.vidaAtual <= 0 THEN
        DELETE FROM InstanciaNpc WHERE id = OLD.id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER t_verifica_npc_morto
AFTER UPDATE ON InstanciaNpc
FOR EACH ROW
EXECUTE FUNCTION verifica_npc_morto();

CREATE OR REPLACE FUNCTION VerificarDropItem(idNpcParam INTEGER)
RETURNS VOID AS $$
DECLARE
    idItemDropado INTEGER;
BEGIN
    SELECT itemDropado INTO idItemDropado FROM Npc WHERE idPersonagem = idNpcParam;

    IF idItemDropado IS NOT NULL THEN
        INSERT INTO InstanciaItem (idItem, idMundo, idBioma)
        VALUES (idItemDropado, (SELECT idMundo FROM InstanciaNpc WHERE id = idNpcParam),
                (SELECT idBioma FROM InstanciaNpc WHERE id = idNpcParam));
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Trig_After_Delete_InstanciaNpc()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM VerificarDropItem(OLD.id);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_delete_instancianpc
AFTER DELETE ON InstanciaNpc
FOR EACH ROW
EXECUTE FUNCTION Trig_After_Delete_InstanciaNpc();

