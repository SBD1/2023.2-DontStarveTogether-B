import db from '../db/db.js';

export async function buscarInstancia(nomeUsuario, idPersonagemJogavel) {
  try {
    const query = `
    SELECT *
    FROM InstanciaPc
    WHERE nomeUsuario = $1 AND idPersonagemJogavel = $2
    `;
    
    const instanciaPc = await db.oneOrNone(query, [nomeUsuario, idPersonagemJogavel]);
    return instanciaPc;
  } catch (error) {
    console.error('Erro ao buscar instância:', error);
    throw error;
  }
}