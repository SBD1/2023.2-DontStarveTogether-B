import db from "../db/db.js";

export async function buscarInstanciasNpc(idMundo, idBioma) {
  try {
    const instanciaNpc = await db.manyOrNone(`SELECT * FROM InstanciaNpc
    WHERE idMundo = $1 AND idBioma = $2`, 
    [idMundo, idBioma]);
    
    return instanciaNpc;
  } catch (error) {
    console.error("Erro ao buscar instância Npc:", error);
    throw error;
  }
}
