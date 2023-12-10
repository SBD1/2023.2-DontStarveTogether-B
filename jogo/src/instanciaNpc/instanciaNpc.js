import db from "../db/db.js";

export async function buscarInstanciasNpc(idMundo, idBioma) {
  try {
    const instanciaNpc = await db.manyOrNone(`
    SELECT 
      INPC.id AS idInstanciaNpc, INPC.idNpc, INPC.idMundo, INPC.idBioma, INPC.vidaAtual,
      NPC.itemDropado, NPC.tipoNpc, NPC.eBoss,
      P.nome AS nomePersonagem, P.descricao AS descricaoPersonagem, P.vida AS vidaPersonagem, P.dano AS danoPersonagem
    FROM
      InstanciaNpc INPC
    JOIN
      Npc NPC ON INPC.idNpc = NPC.idPersonagem
    JOIN
      Personagem P ON NPC.idPersonagem = P.id
    WHERE
      idMundo = $1 AND idBioma = $2`, 
    [idMundo, idBioma]);

    return instanciaNpc;
  } catch (error) {
    console.error("Erro ao buscar instância Npc:", error);
    throw error;
  }
}
