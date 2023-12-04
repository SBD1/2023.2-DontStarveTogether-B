CREATE OR REPLACE FUNCTION criar_usuario_node()
RETURNS VOID AS $$
BEGIN
	DROP USER IF EXISTS node;

    CREATE USER node WITH PASSWORD 'jsn0d3-sbd1';

    GRANT CONNECT ON DATABASE "dont-starve" TO node;

	GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO node;

    GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO node;

END;
$$ LANGUAGE plpgsql;

SELECT criar_usuario_node();
