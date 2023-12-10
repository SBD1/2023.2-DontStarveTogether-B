import db from '../db/db.js';

export async function buscarInstancia(nomeUsuario, idPersonagemJogavel) {
  try {
    const query = `
      SELECT
        IPC.*,
        PC.sanidade,
        PC.fome,
        P.vida,
        P.dano,
        P.nome
      FROM
        InstanciaPC IPC
      JOIN
        PersonagemJogavel PC ON IPC.idPersonagemJogavel = PC.idPersonagem
      JOIN
        Personagem P ON PC.idPersonagem = P.id
      WHERE
        IPC.nomeUsuario = $1 AND IPC.idPersonagemJogavel = $2
    `;
    
    const instanciaPc = await db.oneOrNone(query, [nomeUsuario, idPersonagemJogavel]);
    return instanciaPc;
  } catch (error) {
    console.error('Erro ao buscar instância:', error);
    throw error;
  }
}

export async function buscarInstanciaPcPorId(idInstanciaPc) {
  try {
    const instanciaPc = await db.oneOrNone("SELECT * FROM InstanciaPc WHERE id = $1", [idInstanciaPc]);
    return instanciaPc;
  } catch (error) {
    console.error("Erro ao buscar instância Pc:", error);
    throw error;
  }
}
