import { carregarDados } from "./dadosSessao.js";
import { buscarInstanciaNpcPorId } from "./instanciaNpc/instanciaNpc.js";
import chalk from "chalk";
import db from "./db/db.js";
import { buscarDadosBiomaAtual } from "./game.js";

export async function atacar(idInstanciaNpc) {
  try {
    console.log(chalk.yellow('\nAtacando!!'));

    const instanciaNpc = await buscarInstanciaNpcPorId(idInstanciaNpc);
    const dadosSessao = await carregarDados();

    let danoEquipamentos = 0;
    if(dadosSessao.equipamentos.length > 0) {
      dadosSessao.equipamentos.forEach(equipamento => {
        danoEquipamentos += equipamento.ataque;
      });
    }
    const dano = dadosSessao.instanciaPc.dano + danoEquipamentos;

    await db.none(`
      UPDATE InstanciaNpc
      SET vidaatual = vidaatual - ${dano}
      WHERE id = ${instanciaNpc.id}
    `);

    buscarDadosBiomaAtual(dadosSessao.instanciaPc.nomeusuario, dadosSessao.instanciaPc.idpersonagemjogavel);

    return dano;
  } catch (error) {
    console.error("Erro ao atacar:", error);
    throw error;
  }
}

export function pegarItem(idInstanciaPc, idInstanciaItem) {
  console.log(chalk.yellow('╔════════════════════════════╗'));
  console.log(chalk.yellow('║       Pegando Item         ║'));
  console.log(chalk.yellow('╚════════════════════════════╝\n'));
}

export function derrubarItem() {
  console.log(chalk.yellow('╔════════════════════════════╗'));
  console.log(chalk.yellow('║     Derrubando Item       ║'));
  console.log(chalk.yellow('╚════════════════════════════╝\n'));
}

export function consumir(idInstanciaPc, idInstanciaItem) {
  console.log(chalk.yellow('╔════════════════════════════╗'));
  console.log(chalk.yellow('║          Comendo           ║'));
  console.log(chalk.yellow('╚════════════════════════════╝\n'));
}

export function caminharBioma(idMundoAtual, idBiomaAtual) {
  console.log(chalk.yellow('╔════════════════════════════╗'));
  console.log(chalk.yellow('║         Caminhando         ║'));
  console.log(chalk.yellow('╚════════════════════════════╝\n'));
}

export function salvarESair(idMundo) {
  console.log(chalk.yellow('╔════════════════════════════╗'));
  console.log(chalk.yellow('║      Salvando e Saindo     ║'));
  console.log(chalk.yellow('╚════════════════════════════╝\n'));
}
