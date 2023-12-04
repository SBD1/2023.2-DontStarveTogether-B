// Teste de conexão com o banco de acordo com a string de conexão do db.js
import db from './db.js';

async function testConnection() {
  try {
    const result = await db.query('SELECT $1::text as message', ['Hello, PostgreSQL!']);
    console.log(result[0].message);
  } catch (error) {
    console.error('Erro ao testar a conexão:', error);
  }
}

testConnection();
