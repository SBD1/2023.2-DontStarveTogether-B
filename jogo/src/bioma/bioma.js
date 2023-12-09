import db from "../db/db.js";

export async function buscarBiomaMundo(idMundo, idBioma) {
  try {
    const bioma = await db.oneOrNone(`SELECT B.nome AS nomeBioma, B.descricao, M.nome AS nomeMundo, M.estacao AS nomeEstacao, M.diaAtual AS diaAtual
    FROM BiomaMundo BM
    INNER JOIN Bioma B
    ON B.id = BM.idBioma
    INNER JOIN Mundo M
    ON M.id = BM.idMundo
    WHERE idMundo = $1 AND idBioma = $2`, 
    [idMundo, idBioma]);
    return bioma;
  } catch (error) {
    console.error("Erro ao buscar bioma:", error);
    throw error;
  }
}

