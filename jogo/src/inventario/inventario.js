import db from "../db/db.js";

export async function buscarInventario(nomeUsuario, idPersonagemJogavel) {
  try {
    const inventario = await db.manyOrNone(`
      SELECT
        I.idItem,
        I.quantidade,
        IT.nome,
        IT.descricao
      FROM
        inventario I
      JOIN
        Item IT ON I.idItem = IT.id
      WHERE
        I.nomeUsuario = $1 AND I.idPersonagemJogavel = $2
    `, [nomeUsuario, idPersonagemJogavel]);

    return inventario;
  } catch (error) {
    console.error("Erro ao buscar inventário:", error);
    throw error;
  }
}
