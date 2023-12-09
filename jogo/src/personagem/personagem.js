import db from '../db/db.js';

export async function buscarPersonagensUsuario(username) {
  try {
    const query = `
      SELECT PersonagemUsuario.nomeUsuario, PersonagemUsuario.idPersonagemJogavel, Personagem.nome
      FROM Usuario
      JOIN PersonagemUsuario ON Usuario.nomeUsuario = PersonagemUsuario.nomeUsuario
      JOIN PersonagemJogavel ON PersonagemUsuario.idPersonagemJogavel = PersonagemJogavel.idPersonagem
      JOIN Personagem ON PersonagemJogavel.idPersonagem = Personagem.id
      WHERE Usuario.nomeUsuario = $1;
    `;

    const characterNames = await db.any(query, [username]);
    return characterNames;
  } catch (error) {
    console.error('Erro ao buscar personagens:', error);
    throw error;
  }
}
