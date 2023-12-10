import db from "../db/db.js";

export async function buscarInstanciaItens(idMundo, idBioma) {
  try {
    const itensLocalizacao = await db.manyOrNone(`
      SELECT
        MIN(II.id) AS idInstanciaItem,
        II.idItem,
        II.idMundo,
        II.idBioma,
        I.nome,
        I.descricao,
        SUM(1) AS quantidade
      FROM
        InstanciaItem II
      JOIN
        Item I ON II.idItem = I.id
      WHERE
        II.idMundo = $1
        AND II.idBioma = $2
      GROUP BY
        II.idItem, II.idMundo, II.idBioma, I.nome, I.descricao`, 
      [idMundo, idBioma]);

    return itensLocalizacao;
  } catch (error) {
    console.error("Erro ao buscar itens em localização com contagem:", error);
    throw error;
  }
}
