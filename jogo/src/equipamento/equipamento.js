import db from "../db/db.js";

export async function buscarEquipamentosPersonagem(nomeUsuario, idPersonagemJogavel) {
  try {
    const equipamentos = await db.manyOrNone(`
      SELECT
        EP.id AS idEquipamentoPersonagem,
        EP.idEquipamento,
        EP.durabilidadeAtual,
        CASE
          WHEN E.parteCorpo = 1 THEN 'Cabeça'
          WHEN E.parteCorpo = 2 THEN 'Peito'
          WHEN E.parteCorpo = 3 THEN 'Mão'
          WHEN E.parteCorpo = 4 THEN 'Corpo'
          ELSE 'Desconhecido'
        END AS parteCorpo,
        E.ataque,
        E.protecao,
        E.aumentaInventario,
        I.nome,
        I.descricao
      FROM
        EquipamentoPersonagem EP
      JOIN
        Equipamento E ON EP.idEquipamento = E.idItem
      JOIN
        Item I ON E.idItem = I.id
      WHERE
        EP.nomeUsuario = $1 AND EP.idPersonagemJogavel = $2
    `, [nomeUsuario, idPersonagemJogavel]);

    return equipamentos;
  } catch (error) {
    console.error("Erro ao buscar equipamentos:", error);
    throw error;
  }
}
