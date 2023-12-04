import pgPromise from 'pg-promise';

const pgp = pgPromise();

const connectionConfig = {
  host: 'localhost',
  port: 5432,
  database: 'dont-starve',
  user: 'node',
  password: 'jsn0d3-sbd1', // coloque sua senha até criarmos um .env
};

const db = pgp(connectionConfig);

export default db;
