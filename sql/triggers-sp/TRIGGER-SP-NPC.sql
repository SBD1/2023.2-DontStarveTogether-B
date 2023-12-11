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
