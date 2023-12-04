import db from '../db/db.js';

export async function getWorldsByUser(nomeUsuario) {
  try {
    const worlds = await db.any('SELECT * FROM Mundo WHERE idUsuario = $1', [nomeUsuario]);
    return worlds;
  } catch (error) {
    console.error('Erro ao buscar mundos:', error);
    throw error;
  }
}
