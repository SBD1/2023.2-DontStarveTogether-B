CREATE OR REPLACE FUNCTION revogar_usuario_node()
RETURNS VOID AS $$
DECLARE 
	nome_tabela text;
BEGIN
	FOR nome_tabela IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'public') 
    LOOP
        EXECUTE 'REVOKE ALL PRIVILEGES ON TABLE public.' || nome_tabela || ' FROM node';
    END LOOP;

	REVOKE ALL PRIVILEGES ON DATABASE "dont-starve" FROM "node";
	REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM node;
	REVOKE ALL PRIVILEGES ON SCHEMA public FROM node;
	DROP USER node;
END;
$$ LANGUAGE plpgsql;

SELECT revogar_usuario_node();


CREATE OR REPLACE FUNCTION criar_usuario_node()
RETURNS VOID AS $$
BEGIN

	CREATE USER node WITH PASSWORD 'jsn0d3-sbd1';

	GRANT CONNECT on DATABASE "dont-starve" TO "node";

	GRANT USAGE ON SCHEMA public TO node;

  GRANT ALL PRIVILEGES ON TABLE Mundo TO node;
  GRANT SELECT ON TABLE Bioma TO node; -- Tabelas com privilégio apenas em SELECT são predefinidas
  GRANT ALL PRIVILEGES ON TABLE BiomaMundo TO node;
	GRANT ALL PRIVILEGES ON TABLE Usuario TO node; 
  GRANT ALL PRIVILEGES ON TABLE PersonagemUsuario TO node;
  GRANT SELECT ON TABLE Personagem TO node;
  GRANT SELECT ON TABLE PersonagemJogavel TO node;
  GRANT SELECT ON TABLE Npc TO node;  
  GRANT ALL PRIVILEGES ON TABLE InstanciaPc TO node;
  GRANT ALL PRIVILEGES ON TABLE InstanciaNPc TO node;
  GRANT ALL PRIVILEGES ON TABLE Alianca TO node;
  GRANT SELECT ON TABLE Dialogo TO node;
  GRANT SELECT ON TABLE DialogoPersonagem TO node;
  GRANT ALL PRIVILEGES ON TABLE HabilidadePersonagem TO node;
  GRANT SELECT ON TABLE Habilidade TO node;
  GRANT ALL PRIVILEGES ON TABLE EquipamentoPersonagem TO node;
  GRANT SELECT ON TABLE Item TO node;
  GRANT SELECT ON TABLE Equipamento TO node;
  GRANT SELECT ON TABLE Consumivel TO node;
  GRANT SELECT ON TABLE Colocavel TO node;
  GRANT SELECT ON TABLE Receita TO node;
  GRANT ALL PRIVILEGES ON TABLE Inventario TO node;
  GRANT ALL PRIVILEGES ON TABLE InstanciaColocavel TO node;
  GRANT ALL PRIVILEGES ON TABLE InstanciaItem TO node;

END;
$$ LANGUAGE plpgsql;

SELECT criar_usuario_node();
