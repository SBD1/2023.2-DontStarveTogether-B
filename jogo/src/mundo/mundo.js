import db from '../db/db.js';

export async function buscarMundosUsuario(nomeUsuario) {
  try {
    const worlds = await db.any('SELECT * FROM Mundo WHERE idUsuario = $1', [nomeUsuario]);
    return worlds;
  } catch (error) {
    console.error('Erro ao buscar mundos:', error);
    throw error;
  }
}

export async function atualizaDiaAtual(idMundo) {
  try {
    await db.none('UPDATE Mundo SET diaAtual = diaAtual + 1 WHERE id = $1', [idMundo]);
  } catch (error) {
    console.error('Erro ao atualizar dia:', error);
    throw error;
  }
}
