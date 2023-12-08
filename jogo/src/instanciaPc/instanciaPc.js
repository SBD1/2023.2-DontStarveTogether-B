import db from '../db/db.js';

export async function buscarInstancia(nomeUsuario, idPersonagem) {
  try {
    const query = `
      SELECT *
      FROM PersonagemJogavel
      WHERE idPersonagem = $1 AND nomeUsuario = $2
    `;

    const instanciaPc = await db.oneOrNone(query, [idPersonagem], [nomeUsuario]);
    return instanciaPc;
  } catch (error) {
    console.error('Erro ao buscar instância:', error);
    throw error;
  }
}