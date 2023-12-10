import chalk from 'chalk';
import { buscarInstancia } from './instanciaPc/instanciaPc.js';
import { buscarBiomaMundo } from './bioma/bioma.js';
import { pressioneEnter } from './utils/console.js';
import { buscarInstanciasNpc } from './instanciaNpc/instanciaNpc.js';
import { buscarInstanciaItens } from './instanciaItem/instanciaItem.js';
import { exibirMenu } from './menu.js';

async function game(nomeUsuario, idPersonagemJogavel) {
  const instanciaPc = await buscarInstancia(nomeUsuario, idPersonagemJogavel);

  const biomaMundo = await buscarBiomaMundo(instanciaPc.idmundo, instanciaPc.idbioma);
  console.log(chalk.blue(biomaMundo.nomemundo, "  -  ", biomaMundo.nomeestacao, "  -  ", "Dia: ", biomaMundo.diaatual));
  console.log(chalk.blue('Você está em um(a) ' + biomaMundo.nomebioma, ', ' + biomaMundo.descricao));

  console.log(chalk.white('\nNeste(a) ', biomaMundo.nomebioma, ' possui:'));
  console.log('NPCs:');
  const instanciasNpc = await buscarInstanciasNpc(instanciaPc.idmundo, instanciaPc.idbioma);
  
  instanciasNpc.forEach((instanciaNpc) => {
    if(instanciaNpc.tipoNpc === 'H') {
      console.log(chalk.red("  • ", instanciaNpc.nomepersonagem, ' - ', instanciaNpc.descricaopersonagem));
    } else {
      console.log(chalk.green("  • ", instanciaNpc.nomepersonagem, ' - ', instanciaNpc.descricaopersonagem));
    }
  });

  const instanciasItens = await buscarInstanciaItens(instanciaPc.idmundo, instanciaPc.idbioma);
  console.log('Itens:');
  instanciasItens.forEach((instanciaItem) => {
    console.log(chalk.green("  • ", instanciaItem.nome, `(x${instanciaItem.quantidade})`, ' - ', instanciaItem.descricao));
  });

  await pressioneEnter('Pressione Enter para continuar');

  await exibirMenu();
}

async function imprimeLocalizacao(nomeUsuario, idPersonagemJogavel) {

}

export default game;
