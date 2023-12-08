-- Triggers para garantir o funcionamento do Inventário (Tamanho da mochila, quantidade de itens, etc.)

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
    tamanho SMALLINT; -- Tamanho do inventário da instância jogável
    quantidade_de_itens SMALLINT; -- Quantidade de itens na mochila da instância
BEGIN
    SELECT tamanhoInventario FROM InstanciaPC WHERE id = NEW.idInstanciaPc INTO tamanho;
    SELECT COUNT(*) FROM Inventario WHERE idInstanciaPc = NEW.idInstanciaPc INTO quantidade_de_itens;
    -- Verifica se o item já existe no inventário
    IF EXISTS (SELECT 1 FROM Inventario WHERE idInstanciaPc = NEW.idInstanciaPc AND idItem = NEW.idItem) THEN
        -- Atualiza a quantidade se o item já existe
        UPDATE Inventario SET quantidade = quantidade + NEW.quantidade
        WHERE idInstanciaPc = NEW.idInstanciaPc AND idItem = NEW.idItem;
        RETURN NULL; -- Não insere um novo registro
    ELSE
        -- Verifica se a mochila está cheia
        IF tamanho < quantidade_de_itens + 1 THEN
            RAISE EXCEPTION 'Sua mochila está cheia!';
        END IF;
        RETURN NEW; -- Insere um novo registro se o item não existe e a mochila não está cheia
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_atualiza_inventario
BEFORE INSERT ON Inventario
FOR EACH ROW
EXECUTE PROCEDURE atualiza_inventario();

-- Testes das triggers/sp de inventário:
INSERT INTO Inventario (iditem, idinstanciapc, quantidade)
VALUES
    (15, 1, 1);
Select * From Inventario WHERE idinstanciapc = 1 ORDER BY Iditem;
