import chalk from 'chalk';
import { buscarInstancia } from './instanciaPc/instanciaPc.js';
import { buscarBiomaMundo } from './bioma/bioma.js';
import { pressioneEnter } from './utils/console.js';
import { buscarInstanciasNpc } from './instanciaNpc/instanciaNpc.js';

async function game(nomeUsuario, idPersonagemJogavel) {
  const instanciaPc = await buscarInstancia(nomeUsuario, idPersonagemJogavel);
  
  const biomaMundo = await buscarBiomaMundo(instanciaPc.idmundo, instanciaPc.idbioma);
  console.log(chalk.blue(biomaMundo.nomemundo, "  -  ", biomaMundo.nomeestacao, "  -  ", "Dia: ", biomaMundo.diaatual));
  console.log(chalk.blue('Você está em um(a) ' + biomaMundo.nomebioma, ', ' + biomaMundo.descricao));

  console.log(chalk.white('Neste(a) ', biomaMundo.nomemundo, ' possui:'));
  const instanciasNpc = await buscarInstanciasNpc(instanciaPc.idmundo, instanciaPc.idbioma);
  console.log(instanciasNpc);
  await pressioneEnter('Pressione Enter para continuar');
}

async function imprimeLocalizacao(nomeUsuario, idPersonagemJogavel) {

}

export default game;
