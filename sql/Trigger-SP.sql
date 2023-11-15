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
